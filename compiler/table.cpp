#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"table.h"
#include"error.h"

using namespace std;

DT::DT(){
	DagTable *dt;
	if(dt = new DagTable){
		dt->topnum = 0;
		DagPoint dp;
		dp.name = "Zero Point!";
		dt->dt.push_back(dp);
		s1 = dt;
	}
	else{
		s1 = NULL;
	}
	DagRelateTable *drt;
	if(drt = new DagRelateTable){
		s2 = drt;
	}
	else{
		s2 = NULL;
	}
	DagRelateTable *zjdm;
	if(zjdm = new DagRelateTable){
		s3 = zjdm;
	}
	else{
		s3 = NULL;
	}
	outf.open("out_DagTable.txt");
}

int DT::dt_seek(std::string str){
	outf << "\t\tSEEK IDENT " << str;
	int i;
	int top = s1->dt.size();
	for(i=0;i<top;i++){
		if(s1->dt.at(i).name == str && s1->dt.at(i).fin_or_temp){
			outf << "\t\t\tGOT! -- #" << i << endl;
			return i;
		}
	}
	outf << "\t\t\tNOTFOUND!" << endl;
	return -1;
}

int DT::dt_seek(std::string str,int n){
	outf << "\t\tSEEK TEMP T" << n;
	int i;
	int top = s1->dt.size();
	for(i=0;i<top;i++){
		if(s1->dt.at(i).name == "T" && s1->dt.at(i).value == n && s1->dt.at(i).fin_or_temp){
			outf << "\t\t\tGOT! -- #" << i << endl;
			return i;
		}
	}
	outf << "\t\t\tNOTFOUND!" << endl;
	return -1;
}

int DT::dt_seek(int n){
	outf << "\t\tSEEK CONST " << n;
	int i;
	int top = s1->dt.size();
	for(i=0;i<top;i++){
		if(s1->dt.at(i).name == "CONST" && s1->dt.at(i).value == n){
			outf << "\t\t\tGOT! -- #" << i << endl;
			return i;
		}
	}
	outf << "\t\t\tNOTFOUND!" << endl;
	return -1;
}

int DT::dt_seek(std::string relate,int left,int right){
	outf << "\t\tSEEK RELATE " << left << " " << relate << " " << right;
	int i;
	int top = s2->drt.size();
	for(i=0;i<top;i++){
		if(s2->drt.at(i).relate == relate && s2->drt.at(i).left == left && s2->drt.at(i).right == right){
			outf << "\t\t\tGOT! -- #" << i << endl;
			return s2->drt.at(i).mid;
		}
	}
	outf << "\t\t\tNOTFOUND!" << endl;
	return -1;
}

int DT::dt_create_point(std::string name,int value){
	DagPoint dp;
	dp.left = 0;
	dp.right = 0;
	dp.value = value;
	dp.name = name;
	dp.sym = 1;
	dp.loc = ++s1->topnum;
	dp.fin_or_temp = 1;
	if(name == "T"){
		outf << "CREATE FINAL POINT #"  << s1->topnum << "  T" << value <<endl;
	}
	else if(name == "CONST"){
		dp.fin_or_temp = 0;
		outf << "CREATE FINAL POINT #"  << s1->topnum << "  CONST  " << value <<endl;
	}
	else{
		outf << "CREATE FINAL POINT #"  << s1->topnum << "  " << name <<endl;
	}
	s1->dt.push_back(dp);
	return dp.loc;
}

void DT::dt_change_point_value(int point_index, int loc){
//	cout << "in change size is:" << s1->dt.size() << endl;
	int now_loc = s1->dt.at(point_index).loc;
	int judge = 0;
	std::string name = s1->dt.at(point_index).name;
	int top = s1->dt.size();
	for(int i=0;i<top;i++){
		if(s1->dt.at(i).name == name 
		&& s1->dt.at(i).loc == loc 
		&& s1->dt.at(i).value == s1->dt.at(point_index).value){
			judge =1;
			s1->dt.at(i).fin_or_temp = 1;
			outf << "\t\tNEED NOT CHANGE " << name << s1->dt.at(point_index).value << " -> #" << loc << endl;
			if(i != point_index){
				s1->dt.at(point_index).fin_or_temp = 0;
			}
			break;
		}
	}
	if(judge == 0){
		if(name != "CONST"){
			DagPoint new_dp;
			new_dp.fatnum = s1->dt.at(point_index).fatnum;
			new_dp.fin_or_temp = 1;
			new_dp.left = s1->dt.at(point_index).left;
			new_dp.loc = loc;
			new_dp.sym = 1;
			new_dp.name = s1->dt.at(point_index).name;
			new_dp.right = s1->dt.at(point_index).right;
			new_dp.value = s1->dt.at(point_index).value;
			s1->topnum++;
			s1->dt.push_back(new_dp);
		}
		if(name == "T"){
			int value = s1->dt.at(point_index).value;
			outf << "CREATE TEMP POINT #"  << s1->topnum << "  T" << value <<endl;
		}
		else if(name != "CONST"){
			outf << "CREATE TEMP POINT #"  << s1->topnum << "  " << name <<endl;
		}
		else{
			outf << "CREATE TEMP POINT #"  << s1->topnum << "  " << name <<endl;
		}
		s1->dt.at(point_index).fin_or_temp = 0;
	}   
	return;
}

int DT::dt_create_relate(std::string relate,int left,int right){
	DagRelate new_relate;
	new_relate.left = left;
	new_relate.right = right;
	new_relate.relate = relate;
	new_relate.mid = ++s1->topnum;
	DagPoint dp;
	dp.left = left;
	dp.right = right;
	dp.loc = s1->topnum;
	dp.fatnum = 0;
	dp.name = relate;
	dp.sym = 1;
	dp.value = 0;
	s1->dt.at(left).fatnum++;
	s1->dt.at(right).fatnum++;
	s1->dt.push_back(dp);
	outf << "CREATE POINT #"  << s1->topnum << " " << relate <<endl;
	s2->drt.push_back(new_relate);
	outf << "CREATE RELATE #" << left << "--- " << relate << "(#" << s1->topnum << ") ---#" << right <<endl;
	return dp.loc;
}

void DT::dt_output(std::ofstream & outf_DAG){
	/*  输出DAG图及关系图  */
	outf << "\n########## DAG RES ##########" << endl;
	outf << "#DAG POINT TABLE" << endl;
	outf << "i\tStatus\tname\tloc" << endl;
	std::string status;
	int size = s1->dt.size();
	for(int i=1;i<size;i++){
		status = (s1->dt.at(i).fin_or_temp)?"FINAL":"TEMP ";
		if(s1->dt.at(i).name == "CONST"){
			outf << "#" << i << "\t" << status << "\t" << s1->dt.at(i).value << "\t\t" << s1->dt.at(i).loc << endl;
		}
		else if(s1->dt.at(i).name == "T"){
			outf << "#" << i << "\t" << status << "\tT" << s1->dt.at(i).value << "\t\t" << s1->dt.at(i).loc << endl;
		}
		else{
			outf << "#" << i << "\t" << status << "\t" << s1->dt.at(i).name << "\t\t" << s1->dt.at(i).loc << endl;
		}
	}
	size = s2->drt.size();
	if(size > 0){
		outf << "\n#DAG RELATE TABLE" << endl;
		outf << "\tmid\t\tleft\trelate\tright" << endl;
		for(int i=0;i<size;i++){
			outf << "#" << (i+1) << "\t" << s2->drt.at(i).mid  << " =\t" << s2->drt.at(i).left<< "\t\t" << s2->drt.at(i).relate << "\t\t" << s2->drt.at(i).right << endl;
		}
	}
	outf << "########## END DAG ##########\n" << endl;
	outf << "########## DEAL DAG ##########" << endl;
	/*生成新的中间代码*/
	size = s1->dt.size();
	for(int i=1;i<size;i++){
		if(s1->dt.at(i).fin_or_temp && s1->dt.at(i).loc != i){
			outf << "DEAL FINAL POINT #" << i << " : " << s1->dt.at(i).name;
			if(s1->dt.at(i).name == "T"){
				outf << s1->dt.at(i).value;
			}
			outf << endl;
			dt_deal_point(s1->dt.at(i), i);
		}
	}
	outf << "########## END DEAL ##########\n" << endl;
	size = s3->drt.size();
	for(int i =0;i<size;i++){
		outf << s3->drt.at(i).mid << " " << s3->drt.at(i).left << " " << s3->drt.at(i).relate << " " << s3->drt.at(i).right << endl;
		if(s3->drt.at(i).relate == "=const"){
			if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
				outf_DAG << "T" << s1->dt.at(s3->drt.at(i).mid).value << " = " << s3->drt.at(i).left << endl;
			}
			else{
				outf_DAG << s1->dt.at(s3->drt.at(i).mid).name << " = " << s3->drt.at(i).left << endl;
			}
		}
		else if(s3->drt.at(i).relate == "=T"){
			if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
				outf_DAG << "T" << s1->dt.at(s3->drt.at(i).mid).value << " = T" << s3->drt.at(i).left << endl;
			}
			else{
				outf_DAG << s1->dt.at(s3->drt.at(i).mid).name << " = T" << s3->drt.at(i).left << endl;
			}
		}
		else if(s3->drt.at(i).relate == "=VAR"){
			if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
				outf_DAG << "T" << s1->dt.at(s3->drt.at(i).mid).value << " = ";
				outf_DAG<< s1->dt.at(s3->drt.at(i).left).name;
				if(s1->dt.at(s3->drt.at(i).left).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
				}
				outf_DAG << endl;
			}
			else{
				outf_DAG << s1->dt.at(s3->drt.at(i).mid).name << " = ";
				outf_DAG<< s1->dt.at(s3->drt.at(i).left).name;
				if(s1->dt.at(s3->drt.at(i).left).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
				}
				outf_DAG << endl;
			}
		}
		else if(s3->drt.at(i).relate == "=P"){
			if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
				if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
					outf_DAG << "T" << s1->dt.at(s3->drt.at(i).mid).value << " = " << s1->dt.at(s3->drt.at(i).left).value << endl;
				}
				else{
					outf_DAG << "T" << s1->dt.at(s3->drt.at(i).mid).value << " = ";
					outf_DAG<< s1->dt.at(s3->drt.at(i).left).name;
					if(s1->dt.at(s3->drt.at(i).left).name == "T"){
						outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
					}
					outf_DAG << endl;
				}
			}
			else{
				if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
					outf_DAG << s1->dt.at(s3->drt.at(i).mid).name << " = " << s1->dt.at(s3->drt.at(i).left).value << endl;
				}
				else{
					outf_DAG << s1->dt.at(s3->drt.at(i).mid).name << " = ";
					outf_DAG<< s1->dt.at(s3->drt.at(i).left).name;
					if(s1->dt.at(s3->drt.at(i).left).name == "T"){
						outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
					}
					outf_DAG << endl;
				}
			}
		}
		else if(s3->drt.at(i).relate == "=[]"){
			if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
				outf_DAG << "T" << s1->dt.at(s3->drt.at(i).mid).value << " = ";
				outf_DAG << s1->dt.at(s3->drt.at(i).left).name;
				
				outf_DAG << "[";
				if(s1->dt.at(s3->drt.at(i).right).name == "CONST"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(s1->dt.at(s3->drt.at(i).right).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
				}
				outf_DAG << "]" << endl;
			}
			else{
				outf_DAG << s1->dt.at(s3->drt.at(i).mid).name << " = ";
				outf_DAG << s1->dt.at(s3->drt.at(i).left).name;

				outf_DAG << "[";
				
				if(s1->dt.at(s3->drt.at(i).right).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(s1->dt.at(s3->drt.at(i).right).name == "CONST"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
				}
				outf_DAG << "]" << endl;
			}
		}
		else{
			if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
				outf_DAG << "T" << s1->dt.at(s3->drt.at(i).mid).value << " = ";
				if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
					outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
				}
				else if(s1->dt.at(s3->drt.at(i).left).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).left).name;
					outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
				}
				else{
					outf_DAG << s1->dt.at(s3->drt.at(i).left).name;
				}
				outf_DAG << " " << s3->drt.at(i).relate;
				if(s1->dt.at(s3->drt.at(i).right).name == "CONST"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(s1->dt.at(s3->drt.at(i).right).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
				}
				outf_DAG << endl;
			}
			else{
				outf_DAG << s1->dt.at(s3->drt.at(i).mid).name << " = ";
				if(s1->dt.at(s3->drt.at(i).left).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).left).name;
					outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
				}
				else if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
					outf_DAG << s1->dt.at(s3->drt.at(i).left).value;
				}
				else{
					outf_DAG << s1->dt.at(s3->drt.at(i).left).name;
				}

				outf_DAG << " " << s3->drt.at(i).relate;
				
				if(s1->dt.at(s3->drt.at(i).right).name == "T"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(s1->dt.at(s3->drt.at(i).right).name == "CONST"){
					outf_DAG << s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					outf_DAG << s1->dt.at(s3->drt.at(i).right).name;
				}
				outf_DAG << endl;
			}
		}
	}
	outf << "\n" << endl;
	return;
}

void DT::dt_deal_point(DagPoint father_dp,int deal_point){
	if(s1->dt.at(deal_point).sym == 0){
		return;
	}
	int father_id = deal_point;
	DagRelate drl;
	drl.mid = deal_point;
	drl.relate = "";
//	outf << "JUDGE ### " << deal_point << " ### " << s1->dt.at(deal_point).loc << endl;
	while(deal_point != s1->dt.at(deal_point).loc && s1->dt.at(s1->dt.at(deal_point).loc).sym){
		if(s1->dt.at(deal_point).fin_or_temp == 0){
			s1->dt.at(deal_point).sym = 0;
//			outf << "shut up! " << deal_point << endl;
		}
		outf << "#" << deal_point <<"\t=\t#" << s1->dt.at(deal_point).loc << endl;
		deal_point = s1->dt.at(deal_point).loc;
	}
	DagPoint now_dp = s1->dt.at(deal_point);
	if(s1->dt.at(s1->dt.at(deal_point).loc).sym == 0){
		outf << "#" << deal_point << "\t=\t#" << s1->dt.at(deal_point).loc << endl;
		if(s1->dt.at(deal_point).sym){
			drl.relate = "=P";
			drl.left = s1->dt.at(deal_point).loc;
			drl.right = 0;
		}
	}
	else if(s1->dt.at(deal_point).name == "CONST"){
		outf << "#" << deal_point <<"\t=\t" << s1->dt.at(deal_point).value << endl;
		if(father_id != deal_point){
			drl.relate = "=const";
			drl.left = s1->dt.at(deal_point).value;
			drl.right = 0;
		}
		s1->dt.at(deal_point).fin_or_temp = 0;
	}
	else if(now_dp.name == "+"	||  now_dp.name == "-"
		||  now_dp.name == "*"	||  now_dp.name == "/"){
		drl.relate = now_dp.name;
		int s2top = s2->drt.size();
		int i;
		for(i = 0;i<s2top;i++){
			if(s2->drt.at(i).mid == deal_point){
				DagPoint left_dp = s1->dt.at(s2->drt.at(i).left);
				DagPoint right_dp = s1->dt.at(s2->drt.at(i).right);
				dt_deal_point(left_dp, s2->drt.at(i).left);
				dt_deal_point(right_dp, s2->drt.at(i).right);
				drl.left = s2->drt.at(i).left;
				drl.right = s2->drt.at(i).right;
				/* 子节点均为CONST，父节点更新为CONST */

//				if(s1->dt.at(s2->drt.at(i).left).name == "CONST" && s1->dt.at(s2->drt.at(i).right).name == "CONST"){
	//				s1->dt.at(deal_point).value = s1->dt.at(s2->drt.at(i).left).value + s1->dt.at(s2->drt.at(i).right).value;
		//			s1->dt.at(deal_point).name = "CONST";
			//	}
				//else{
					if(s1->dt.at(s2->drt.at(i).left).name == "CONST"){
						if(s1->dt.at(s2->drt.at(i).right).name == "T"){
							outf << "#" << deal_point << "\t=\t" << s1->dt.at(s2->drt.at(i).left).value << s2->drt.at(i).relate << "T" << s1->dt.at(s2->drt.at(i).right).value << endl;
						}
						else{
							outf << "#" << deal_point << "\t=\t" << s1->dt.at(s2->drt.at(i).left).value << s2->drt.at(i).relate << s1->dt.at(s2->drt.at(i).right).name << endl;
						}
					}
					else if(s1->dt.at(s2->drt.at(i).right).name == "CONST"){
						if(s1->dt.at(s2->drt.at(i).left).name == "T"){
							outf << "#" << deal_point << "\t=\tT" << s1->dt.at(s2->drt.at(i).left).value << s2->drt.at(i).relate << s1->dt.at(s2->drt.at(i).right).value << endl;
						}
						else{
							outf << "#" << deal_point << "\t=\t" << s1->dt.at(s2->drt.at(i).left).name << s2->drt.at(i).relate << s1->dt.at(s2->drt.at(i).right).value << endl;
						}
					}
					else{
						if(left_dp.name == "T" && right_dp.name == "T"){
							outf << "#" << deal_point << "\t=\tT" << left_dp.value << s2->drt.at(i).relate << "T" <<right_dp.value << endl;
						}
						else if(left_dp.name == "T"){
							outf << "#" << deal_point << "\t=\tT" << left_dp.value << s2->drt.at(i).relate << right_dp.name << endl;
						}
						else if(right_dp.name == "T"){
							outf << "#" << deal_point<< "\t=\t" << left_dp.name << s2->drt.at(i).relate << "T" <<right_dp.value << endl;
						}
						else{
							outf << "#" << deal_point << "\t=\t" <<left_dp.name << s2->drt.at(i).relate << right_dp.name << endl;
						}
					}
				//}
				break;
			}
		}
	}
	else if(now_dp.name == "=[]"){
		drl.relate = "=[]";
		int s2top = s2->drt.size();
		int i;
		for(i = 0;i<s2top;i++){
			if(s2->drt.at(i).mid == deal_point){
				DagPoint left_dp = s1->dt.at(s2->drt.at(i).left);
				DagPoint right_dp = s1->dt.at(s2->drt.at(i).right);
				dt_deal_point(right_dp, s2->drt.at(i).right);
				drl.left = s2->drt.at(i).left;
				drl.right = s2->drt.at(i).right;
				
				if(s1->dt.at(s2->drt.at(i).right).name == "CONST"){
					outf << "#" << deal_point << "\t=\t" << s1->dt.at(s2->drt.at(i).left).name;
					outf << "[" << s1->dt.at(s2->drt.at(i).right).value << "]" << endl;
				}
				else{
					if(right_dp.name == "T"){
						outf << "#" << deal_point<< "\t=\t" << left_dp.name;
						outf << "[T" <<right_dp.value << "]" << endl;
					}
					else{
						outf << "#" << deal_point << "\t=\t" <<left_dp.name;
						outf << "[" << right_dp.name << "]" << endl;
					}
				}
				break;
			}
		}
	}
	else{
		drl.relate = "=T";
		drl.left = s1->dt.at(deal_point).value;
		drl.right = 0;
		s1->dt.at(deal_point).fin_or_temp = 0;
		if(s1->dt.at(deal_point).name == "T"){
			outf << "#" << deal_point <<"\t=\tT" << s1->dt.at(deal_point).value << endl;
		}
		else{
			drl.relate = "=VAR";
			drl.left = deal_point;
			outf << "#" << deal_point <<"\t=\t" << s1->dt.at(deal_point).name << endl;
		}
	}
	if(drl.relate != ""){
		s3->drt.push_back(drl);
	}
//	outf << "shut up! " << father_id << endl;
	s1->dt.at(father_id).sym = 0;
	return;
}

void DT::dt_delete_relate(){
	s1->dt.clear();
	DagPoint dp;
	dp.name = "You Should not See This!";
	s1->dt.push_back(dp);
	s1->topnum = 0;
	s2->drt.clear();
	s3->drt.clear();
}

int DT::dt_zjdm_GetBack_judge(int count){
	int size = s3->drt.size();
	return (count < size);
}

PCode DT::dt_zjdm_GetBack(int i){
	PCode pc;
	if(s3->drt.at(i).relate == "=const"){
		if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
			/* Tnum1 = num3 */
			pc.str = "=";
			pc.num1 = s1->dt.at(s3->drt.at(i).mid).value;
			pc.num2 = 0;
			pc.num3 = s3->drt.at(i).left;
		}
		else{
			/* str = num2 */
			pc.str = s1->dt.at(s3->drt.at(i).mid).name;
			pc.num1 = -1;
			pc.num2 = s1->dt.at(s3->drt.at(i).mid).value;
			pc.num3 = -2;
		}
	}
	else if(s3->drt.at(i).relate == "=T"){
		if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
			/* Tnum1 = Tnum3 */
			pc.str = "=";
			pc.num1 = s1->dt.at(s3->drt.at(i).mid).value;
			pc.num2 = -6;
			pc.num3 = s3->drt.at(i).left;
		}
		else{
			/* str = Tnum2 */
			pc.str = s1->dt.at(s3->drt.at(i).mid).name;
			pc.num1 = -1;
			pc.num2 = s3->drt.at(i).left;
			pc.num3 = -1;
		}
	}
	else if(s3->drt.at(i).relate == "=VAR"){
		if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
			if(s1->dt.at(s3->drt.at(i).left).name == "T"){
				/* Tnum1 = Tnum3 */
				pc.str = "=";
				pc.num1 = s1->dt.at(s3->drt.at(i).mid).value;
				pc.num2 = -6;
				pc.num3 = s1->dt.at(s3->drt.at(i).left).value;
			}
			else{
				/* Tnum2 = str */
				pc.str = s1->dt.at(s3->drt.at(i).left).name;
				pc.num1 = -1;
				pc.num2 = s1->dt.at(s3->drt.at(i).mid).value;
				pc.num3 = 0;
			}
		}
		else{
			if(s1->dt.at(s3->drt.at(i).left).name == "T"){
				/* str = Tnum2 */
				pc.str = s1->dt.at(s3->drt.at(i).mid).name;
				pc.num1 = -1;
				pc.num2 = s1->dt.at(s3->drt.at(i).left).value;
				pc.num3 = -1;
			}
			else{
				/* str = str2 */
				pc.str = s1->dt.at(s3->drt.at(i).mid).name;
				pc.str2 = s1->dt.at(s3->drt.at(i).left).name;
				pc.num1 = -1;
				pc.num2 = 1;
				pc.num3 = -3;
			}
		}
	}
	else if(s3->drt.at(i).relate == "=P"){
		if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
			if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
				/* Tnum1 = num3 */
				pc.str = "=";
				pc.num1 = s1->dt.at(s3->drt.at(i).mid).value;
				pc.num2 = 0;
				pc.num3 = s1->dt.at(s3->drt.at(i).left).value;
			}
			else{
				if(s1->dt.at(s3->drt.at(i).left).name == "T"){
					/* Tnum1 = Tnum3 */
					pc.str = "=";
					pc.num1 = s1->dt.at(s3->drt.at(i).mid).value;
					pc.num2 = -6;
					pc.num3 = s1->dt.at(s3->drt.at(i).left).value;
				}
				else{
					/* Tnum2 = str */
					pc.str = s1->dt.at(s3->drt.at(i).left).name;
					pc.num1 = -1;
					pc.num2 = s1->dt.at(s3->drt.at(i).mid).value;
					pc.num3 = 0;
				}
			}
		}
		else{
			if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
				/* str = num2 */
				pc.str = s1->dt.at(s3->drt.at(i).mid).name;
				pc.num1 = -1;
				pc.num2 = s1->dt.at(s3->drt.at(i).left).value;
				pc.num3 = -2;
			}
			else{
				if(s1->dt.at(s3->drt.at(i).left).name == "T"){
					/* str = Tnum2 */
					pc.str = s1->dt.at(s3->drt.at(i).mid).name;
					pc.num1 = -1;
					pc.num2 = s1->dt.at(s3->drt.at(i).left).value;
					pc.num3 = -1;
				}
				else{
					/* str = str2 */
					pc.str = s1->dt.at(s3->drt.at(i).mid).name;
					pc.str2 = s1->dt.at(s3->drt.at(i).left).name;
					pc.num1 = -1;
					pc.num2 = 1;
					pc.num3 = -3;
				}
			}
		}
	}
	else{
		if(s1->dt.at(s3->drt.at(i).mid).name == "T"){
			/* Tnum2 = ... */
			pc.num1 = -20;
			pc.num2 = s1->dt.at(s3->drt.at(i).mid).value;

			if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
				/* Tnum2 = num4 relate ... */
				pc.num3 = 1;
				pc.num4 = s1->dt.at(s3->drt.at(i).left).value;
			}
			else if(s1->dt.at(s3->drt.at(i).left).name == "T"){
				/* Tnum2 = Tnum4 relate ... */
				pc.num3 = 2;
				pc.num4 = s1->dt.at(s3->drt.at(i).left).value;
			}
			else{
				/* Tnum2 = str relate ... */
				pc.num3 = 3;
				pc.str = s1->dt.at(s3->drt.at(i).left).name;
			}

			pc.relate = s3->drt.at(i).relate;
			
			if(s1->dt.at(s3->drt.at(i).right).name == "CONST"){
				if(pc.num3 == 1){
					/* Tnum2 = num4 */
					if(pc.relate == "+")
						pc.num4 += s1->dt.at(s3->drt.at(i).right).value;
					else if(pc.relate == "-")
						pc.num4 -= s1->dt.at(s3->drt.at(i).right).value;
					else if(pc.relate == "*")
						pc.num4 *= s1->dt.at(s3->drt.at(i).right).value;
					else if(pc.relate == "/")
						pc.num4 /= s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(pc.num3 == 2){
					/* Tnum2 = Tnum4 relate num5 */
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					/* Tnum2 = str relate num5 */
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
			}
			else if(s1->dt.at(s3->drt.at(i).right).name == "T"){
				if(pc.num3 == 1){
					/* Tnum2 =  Tnum4 relate num5 */
					pc.num3 = 2;
					pc.num5 = pc.num4;
					pc.num4 = s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(pc.num3 == 2){
					/* Tnum2 = Tnum4 relate Tnum5 */
					pc.num3 = 4;
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					/* Tnum2 = str relate Tnum5 */
					pc.num3 = 5;
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
			}
			else{
				if(pc.num3 == 1){
					/* Tnum2 = str relate num5 */
					pc.num3 = 3;
					pc.num5 = pc.num4;
				}
				else if(pc.num3 == 2){
					/* Tnum2 = str relate Tnum5 */
					pc.num3 = 5;
					pc.num5 = pc.num4;
					pc.str = s1->dt.at(s3->drt.at(i).right).name;
				}
				else{
					/* Tnum2 = str relate str2 */
					pc.num3 = 6;
					pc.str = s1->dt.at(s3->drt.at(i).right).name;
				}
			}
		}
		else{
			/* str0 = ... */
			pc.num1 = -21;
			pc.str0 = s1->dt.at(s3->drt.at(i).mid).name;
			if(s1->dt.at(s3->drt.at(i).left).name == "CONST"){
				/* str = num4 relate ... */
				pc.num3 = 1;
				pc.num4 = s1->dt.at(s3->drt.at(i).left).value;
			}
			else if(s1->dt.at(s3->drt.at(i).left).name == "T"){
				/* str = Tnum4 relate ... */
				pc.num3 = 2;
				pc.num4 = s1->dt.at(s3->drt.at(i).left).value;
			}
			else{
				/* str = str relate ... */
				pc.num3 = 3;
				pc.str = s1->dt.at(s3->drt.at(i).left).name;
			}

			pc.relate = s3->drt.at(i).relate;
			
			if(s1->dt.at(s3->drt.at(i).right).name == "CONST"){
				if(pc.num3 == 1){
					/* str = num4 */
					if(pc.relate == "+")
						pc.num4 += s1->dt.at(s3->drt.at(i).right).value;
					else if(pc.relate == "-")
						pc.num4 -= s1->dt.at(s3->drt.at(i).right).value;
					else if(pc.relate == "*")
						pc.num4 *= s1->dt.at(s3->drt.at(i).right).value;
					else if(pc.relate == "/")
						pc.num4 /= s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(pc.num3 == 2){
					/* str = Tnum4 relate num5 */
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					/* str = str relate num5 */
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
			}
			else if(s1->dt.at(s3->drt.at(i).right).name == "T"){
				if(pc.num3 == 1){
					/* str =  Tnum4 relate num5 */
					pc.num3 = 2;
					pc.num5 = pc.num4;
					pc.num4 = s1->dt.at(s3->drt.at(i).right).value;
				}
				else if(pc.num3 == 2){
					/* str = Tnum4 relate Tnum5 */
					pc.num3 = 4;
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
				else{
					/* str = str relate Tnum5 */
					pc.num3 = 5;
					pc.num5 = s1->dt.at(s3->drt.at(i).right).value;
				}
			}
			else{
				if(pc.num3 == 1){
					/* str = str relate num5 */
					pc.num3 = 3;
					pc.num5 = pc.num4;
				}
				else if(pc.num3 == 2){
					/* str = str relate Tnum5 */
					pc.num3 = 5;
					pc.num5 = pc.num4;
					pc.str = s1->dt.at(s3->drt.at(i).right).name;
				}
				else{
					/* str = str relate str2 */
					pc.num3 = 6;
					pc.str = s1->dt.at(s3->drt.at(i).right).name;
				}
			}
		}
	}
	return pc;
}



FT::FT(){
	FuncTable *ft;
	if(ft = new FuncTable){
		ft->top = -1;
		s = ft;
	}
	else{
		s = NULL;
	}
	outf.open("out_FuncTable.txt");
}

int FT::ft_push(std::string name,int para){
	outf << "PUSH IN FUNCTABLE #" << s->top+1;
	outf << " " << name << " " << para << endl;
	if(s->top+1>MAXSIZE){
		return 0;
	}
	int i;
	for(i=0;i<s->top;i++){
		if(s->func[i].name == name){
			return 0;
		}
	}
	Func *new_func;
	if(new_func = new Func){
		new_func->name = name;
		new_func->para = para;
		s->func[++s->top] = *new_func;
		return 1;
	}
	return 0;
}

void FT::ft_add(int para){
	if(s->top<0){
		return;
	}
	s->func[s->top].para += 1;
}

int FT::ft_para(std::string name){
	int i;
	for(i=0;i<=s->top;i++){
		if(s->func[i].name == name){
			return s->func[i].para;
		}
	}
	return 0;
}
int FT::ft_last_para(){
	if(s->top<0){
		return 0;
	}
	return s->func[s->top].para;
}

int FT::ft_conf(std::string name){
	int i;
	for(i=0;i<=s->top;i++){
		if(s->func[i].name == name){
			return 1;
		}
	}
	return 0;
}

int FT::ft_size(){
	return s->top;
}









ST::ST(){
	SymTable *st;
	if(st = new SymTable){
		st->top = -1;
		s = st;
	}
	else{
		s = NULL;
	}
	const_sp = -1;
	const_judge = 1;
	outf.open("out_SymTable.txt");
}

int ST::st_push(std::string name,int level,int type,int value){
	if(s->top+1>MAXSIZE){
		outf << "Stack is full??" << endl;
		return 0;
	}
	int i;
//	outf << "name:" << name << "  level:" << level <<endl;
	if(type <3){
		const_judge = 0;
	}
	if(type == 9){
		for(i=s->top;i>=0;i--){
			if(s->symbol[i].type <3){
				break;
			}
			if(s->symbol[i].name == "T" && s->symbol[i].level == level){
				return 0;
			}
		}
	}
	for(i=s->top;i>=0;i--){
		if(st_seek(name,1) && name!="T"){
			cout << "same name :" << name << endl;
		}
	}
	Symbol *new_sym;
	if(new_sym = new Symbol){
		new_sym->name = name;
		new_sym->level = level;
		new_sym->type = type;
		new_sym->value = value;
		if(type == 7 || type == 8){
			new_sym->location = st_loc(value);
		}
		else if(type<3){
			new_sym->location = 0;
		}
		else{
			new_sym->location = st_loc(1);
		}
		s->symbol[++s->top] = *new_sym;
		if(type<3){
			outf<<endl;
		}
		
		if(const_judge){
			const_sp++;
		}
		outf << "PUSH IN SymTable: #" << (s->top+1) << "  " << name << "  ";
		outf <<level<<"  "<<type<< "  " <<value << "  #" << new_sym->location <<endl;
		return 1;
	}
	else{
		outf << "Couldn't Create!" << endl;
	}
	return 0;
}

void ST::st_pop(int level){
	int i;
	for(i=s->top;i>=0;i--){
		if(s->symbol[i].level >= level){
			outf << "POP OUT: #" << (i) << "  " << s->symbol[i].name << "  ";
			outf <<level<<"  "<<s->symbol[i].type<< "  " <<s->symbol[i].value <<endl; 
//			delete &s->symbol[i];
			s->top--;
		}
		else{
			break;
		}
	}
}

int ST::st_seek(std::string name,int push_or_pop){
	int i;
	for(i=s->top;i>=0;i--){
		if(s->symbol[i].type <3 && push_or_pop){
			return 0;
		}
		if(s->symbol[i].type <3 && !push_or_pop){
			if(s->symbol[i].name == name){
				return (s->symbol[i].type+1);
			}
			for(i=const_sp;i>=0;i--){
				if(s->symbol[i].name == name){
					return (s->symbol[i].type+1);
				}
			}
			return 0;
		}
		if(s->symbol[i].name == name){
			return (s->symbol[i].type+1);
		}
	}
	return 0;
}

int ST::st_func_type(std::string name){
	int i;
	for(i=s->top;i>=0;i--){
		if(s->symbol[i].name == name){
			return (s->symbol[i].type+1);
		}
	}
	return 0;
}

int ST::st_size(){
	return s->top;
}

void ST::st_change(int value){
	s->symbol[s->top].type +=2;
	s->symbol[s->top].value = value;
	int i;
	for(i=s->top;i>=0;i--){
		if(s->symbol[i].type <3 ){
			s->symbol[i].location +=4*value-4;
			return;
		}
	}
	outf << "Change to" << " type:"<< s->symbol[s->top].type << " value:" << value << endl;
}

int ST::st_loc(int weight){
	int i;
	int location;
	for(i=s->top;i>=0;i--){
		if(s->symbol[i].type <3 ){
			location = s->symbol[i].location;
			s->symbol[i].location +=4*weight;
			return location;
		}
	}
	return s->top+1;
}

int ST::get_loc(std::string func_name,std::string sym_name,int value){
	int i;
	int size = s->top;
//	cout << func_name << "   " << sym_name << endl;
	for(i=0;i<=size;i++){
		if(s->symbol[i].type <3 && s->symbol[i].name == func_name){
			for(;i<=size;){
				if(value>=0){
					if(s->symbol[i].name == sym_name && value == s->symbol[i].level){
						return s->symbol[i].location;
					}
				}
				else{
					if(s->symbol[i].name == sym_name){
						return s->symbol[i].location;
					}
				}
				i++;
				if(i>size){
					return -1;
				}
				if(s->symbol[i].type <3 ){
					return -1;
				}
			}
		}
	}
	return -1;
}

int ST::getpara_offset(std::string name){
	int i;
	int para_num = 1;
	int size = s->top;
	for(i=0;i<=size;i++){
		if(s->symbol[i].type <3 && s->symbol[i].name == name){
			for(;;para_num++){
				if(i+para_num>size){
					break;
				}
				if(s->symbol[i+para_num].level != 2){
					break;
				}
			}
			para_num--;
			return para_num*4;
		}
	}
	return 0;
}

int ST::array_length(std::string name){
	int i;
	for(i=s->top;i>=0;i--){
		if(s->symbol[i].type <3){
			for(i=const_sp;i>=0;i--){
				if(s->symbol[i].name == name){
					return (s->symbol[i].value-1);
				}
			}
			return 0;
		}
		if(s->symbol[i].name == name){
			return (s->symbol[i].value-1);
		}
	}
	return 0;
}

void ST::st_add_weight(std::string name,int add_num){
	if(name == "T"){
		return;
	}
	int i;
	for(i=s->top;i>=0;i--){
		if(s->symbol[i].type <3){
			return;
		}
		if(s->symbol[i].name == name ){
			if(s->symbol[i].type >=3 && s->symbol[i].type <= 6){
				s->symbol[i].weight += add_num;
			}
			return;
		}
	}
	return;
}

void ST::st_sort_weight(std::string func_name){
	int i;
	int size = s->top;
	int max_num=1;
	for(i=0;i<=size;i++){
		if(s->symbol[i].type <3 && s->symbol[i].name == func_name){
			for(i++;i<=size;i++){
				if(s->symbol[i].type <3){
					i=size+1;
					break;
				}
				if(s->symbol[i].name == "T"){
					continue;
				}
				if(s->symbol[i].type >=3 && s->symbol[i].type <= 6){
					if(max_num <= 7){
						weight_max[max_num] = s->symbol[i].name;
						weight_max_num[max_num] = s->symbol[i].weight;
						max_num++;
					}
					else{
						int min=99999;
						for(int j=1;j<=7;j++){
							if(weight_max_num[j] < min){
								min = weight_max_num[j];
							}
						}
						if(s->symbol[i].weight > min){
							for(int j=1;j<=7;j++){
								if(weight_max_num[j] == min){
									weight_max_num[j] = s->symbol[i].weight;
									weight_max[j] = s->symbol[i].name;
									break;
								}
							}
						}
					}
				}
			}
		}
	}
	for(;max_num<=7;max_num++){
		weight_max[max_num] = "";
	}
//	cout << func_name << endl;
//	for(max_num=1;max_num<=7;max_num++){
//		cout << weight_max[max_num] << endl;;
//	}
	return;
}

int ST::st_MaxJudge(std::string name){
	for(int i = 1;i<=7;i++){
		if(weight_max[i] == ""){
			return 0;
		}
		if(weight_max[i] == name){
			return i;
		}
	}
	return 0;
}

std::string ST::st_max_get(int i){
	if(i>0 && i <= 7){
		return weight_max[i];
	}
	return "";
}
