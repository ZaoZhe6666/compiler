#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include<vector>
#include"zjdm.h"
#include"error.h"

using namespace std;

extern DT dt;

ZJ::ZJ(){
	outf.open("out_zj.txt");
	outf_DAG.open("out_zj_DAG.txt");
	label_num = 0;
	ptop = -1;
}

PCode ZJ::getcode(int num){
	if(num <= ptop){
//		return pcode[num];
		return pcode.at(num);
	}
//	return pcode[0];
	return pcode.at(0);
}

void ZJ::deal_Dag(){
	if(DAG.size() > 0){
		int i;
		int dsize = DAG.size();
		int num1,num2,num3;
		int judge;
		std::string str;
		/*将DAG中存储的中间代码，转换并生成DAG图*/
//		outf_DAG << "size: " << dsize << endl;
		for(i=0;i<dsize;i++){
//			outf_DAG << DAG.at(i).num1 << " " << DAG.at(i).num2 << " " << DAG.at(i).num3 << " " << DAG.at(i).str <<endl;

			num1 = DAG.at(i).num1;
			num2 = DAG.at(i).num2;
			num3 = DAG.at(i).num3;
			str  = DAG.at(i).str;
			judge = 0;
			if(num1 < 0){
				if(num1 == -1){
					if(num3 == -1){
						/* str = Tnum2 */
						int left =dt.dt_seek(str);
						int right = dt.dt_seek("T", num2);
						if(left < 0){
							left = dt.dt_create_point(str,0);
						}
						if(right < 0){
							right = dt.dt_create_point("T", num2);
						}
						dt.dt_change_point_value(left, right);
					}
					else if(num3 == 0){
						/* Tnum2 = str */
						int left = dt.dt_seek("T", num2);
						int right = dt.dt_seek(str);
						if(left < 0){
							left = dt.dt_create_point("T", num2);
						}
						if(right < 0){
							right = dt.dt_create_point(str, 0);
						}
						dt.dt_change_point_value(left, right);
					}
					else{
						/* Tnum3 +|-|*|/= str */
						std::string relate_list[6] = {"","+","-","*","/"};
						int left = dt.dt_seek("T", num2);
						int right = dt.dt_seek(str);
						if(left < 0){
							left = dt.dt_create_point("T", num2);
						}
						if(right < 0){
							right = dt.dt_create_point(str, 0);
						}
						int relate_judge = dt.dt_seek(relate_list[num3], left, right);
						if(relate_judge < 0){
							int new_left = dt.dt_create_relate(relate_list[num3],left,right);
							dt.dt_change_point_value(left, new_left);
						}
						else{
							dt.dt_change_point_value(left, relate_judge);
						}
					}
				}
				else if(num1 == -6){
					if(num3 < 0){
						/* Tnum2 /= str[ Tnum3 ] */	
						int left_brack = dt.dt_seek(str);
						if(left_brack < 0){
							left_brack = dt.dt_create_point(str, 0);
						}
						num3 *= -1;
						int right_brack = dt.dt_seek("T", num3);
						if(right_brack < 0){
							right_brack = dt.dt_create_point("T", num3);
						}
						int right = dt.dt_create_relate("=[]", left_brack, right_brack);
						int left = dt.dt_seek("T", num2);
						if(left < 0){
							left = dt.dt_create_point("T", num2);
						}
						dt.dt_change_point_value(left, right);
						int new_left = dt.dt_seek("T", num2);
						left = dt.dt_create_relate("/", left, new_left);
						dt.dt_change_point_value(new_left, left);
					}
					else{
						/* Tnum2 *= str[ Tnum3 ] */	
						int left_brack = dt.dt_seek(str);
						if(left_brack < 0){
							left_brack = dt.dt_create_point(str, 0);
						}
						int right_brack = dt.dt_seek("T", num3);
						if(right_brack < 0){
							right_brack = dt.dt_create_point("T", num3);
						}
						int right = dt.dt_create_relate("=[]", left_brack, right_brack);
						int left = dt.dt_seek("T", num2);
						if(left < 0){
							left = dt.dt_create_point("T", num2);
						}
						dt.dt_change_point_value(left, right);
						int new_left = dt.dt_seek("T", num2);
						left = dt.dt_create_relate("*", left, new_left);
						dt.dt_change_point_value(new_left, left);
					}
				}
			}
			else{
			/*赋值操作
			  num2  num1   num3
				-6	T2 = T4
				-5  T2 = w4
				-4	T2 = T2 / w4
				-3	T2 = T2 * w4
				-2	T2 = T2 - w4
				-1	T2 = T2 + w4
				0	T2 = w4
				1	T2 = T2 + T4
				2	T2 = T2 - T4
				3	T2 = T2 * T4
				4	T2 = T2 / T4
			*/
				if(num2 == -6){
					int left = dt.dt_seek("T",num1);
					int right = dt.dt_seek("T",num3);
					if(right < 0){
						right = dt.dt_create_point("T",num3);
					}
					if(left < 0){
						left = dt.dt_create_point("T",num1);
					}
					dt.dt_change_point_value(left,right);
				}
				else if(num2 == -5 || num2 == 0){
					int right = dt.dt_seek(num3);
					int left = dt.dt_seek("T",num1);
					if(right < 0){
						right = dt.dt_create_point("CONST",num3);
					}
					if(left < 0){
						left = dt.dt_create_point("T",num1);
					}
					dt.dt_change_point_value(left,right);
				}
				else if(num2 >= -4 && num2 <= -1){
					num2 *= -1;
					int left = dt.dt_seek("T",num1);
					int right = dt.dt_seek(num3);
					std::string relate_list[6] = {"","+","-","*","/"};
					if(right < 0){
						right = dt.dt_create_point("CONST", num3);
					}
					if(left < 0){
						left = dt.dt_create_point("T", num1);
					}
					int relate_judge = dt.dt_seek(relate_list[num2],left,right);
					if(relate_judge < 0){
						int new_left = dt.dt_create_relate(relate_list[num2],left,right);
						dt.dt_change_point_value(left, new_left);
					}
					else{
						dt.dt_change_point_value(left, relate_judge);
					}
				}
				else{
					std::string relate_list[6] = {"","+","-","*","/"};
					int left = dt.dt_seek("T", num1);
					int right = dt.dt_seek("T", num3);
					if(right < 0){
						right = dt.dt_create_point("CONST", num3);
					}
					if(left < 0){
						left = dt.dt_create_point("T", num1);
					}
					int relate_judge = dt.dt_seek(relate_list[num2],left,right);
					if(relate_judge < 0){
						int new_left = dt.dt_create_relate(relate_list[num2],left,right);
						dt.dt_change_point_value(left, new_left);
					}
					else{
						dt.dt_change_point_value(left, relate_judge);
					}
				}
			}
		}
		/*将生成的DAG图转换成删减后的目标代码*/
		dt.dt_output(outf_DAG);

		/*清空DAG*/
		dt.dt_delete_relate();
		DAG.clear();
//		outf_DAG << "\n\n" << endl;
	}
	return;
}

void ZJ::midcode(std::string w1,int w2,int w3,int w4){
	if(w1 != "jmp" || (w3 != 1 && w3 != -1)){
		ptop++;
		PCode pc_new;
		pc_new.str = w1;
		pc_new.num1 = w2;
		pc_new.num2 = w3;
		pc_new.num3 = w4;
		pcode.push_back(pc_new);
		if(w1 == "="){
			DAG.push_back(pc_new);
		}
		else{
			deal_Dag();
			pcode_DAG.push_back(pc_new);
		}
	}
	midcode_deal(w1,w2,w3,w4,outf);
	midcode_deal(w1,-1*w2,w3,w4,outf_DAG);
}

void ZJ::midcode_deal(std::string w1,int w2,int w3, int w4,std::ofstream & outf){
	extern Error error;
	int dag_judge = 1;
	if(w2 < 0){
		w2 *= -1;
		dag_judge = 0;
	}
	if(w1 == "=" && dag_judge){
		/*
		-6  T2 = T4
		-5  T2 = w4
		-4	T2 = T2 / w4
		-3	T2 = T2 * w4
		-2	T2 = T2 - w4
		-1	T2 = T2 + w4
		0	T2 = w4
		1	T2 = T2 + T4
		2	T2 = T2 - T4
		3	T2 = T2 * T4
		4	T2 = T2 / T4
		*/
		if(w3 == -6){
			outf << "T" << w2 << " = T"<< w4 << endl;
		}
		else if(w3 == -5){
			outf << "T" << w2 << " = "<< w4 << endl;
		}
		else if(w3 == -4){
			outf << "T" << w2 << "/= "<< w4 << endl;
		}
		else if(w3 == -3){
			outf << "T" << w2 << "*= "<< w4 << endl;
		}
		else if(w3 == -2){
			outf << "T" << w2 << "-= "<< w4 << endl;
		}
		else if(w3 == -1){
			outf << "T" << w2 << "+= "<< w4 << endl;
		}
		else if(w3 == 0){
			outf << "T" << w2 << " = "<< w4 <<endl;
		}
		else if(w3 == 1){
			outf << "T" << w2 << "+= T"<< w4 << endl;
		}
		else if(w3 == 2){
			outf << "T" << w2 << "-= T"<< w4 << endl;
		}
		else if(w3 == 3){
			outf << "T" << w2 << "*= T"<< w4 << endl;
		}
		else if(w3 == 4){
			outf << "T" << w2 << "/= T"<< w4 << endl;
		}
		else{
//			error.PrintError(-501,-1,-1);
		}
	}
	else if(w1 == "<" || w1 == "<=" || w1 == "==" ||
			w1 == ">" || w1 == ">=" || w1 == "!="){
		outf << "\nT" << w2 << " = T" << w2 << w1 << "T" << w4 << endl;
	}
	else if(w1 == "jmp"){
		if(w3 == -2){
			outf << "while T" << w2 <<" is True jump to label " << w4  << "\n" << endl;
		}
		else if(w3 == -1){
			outf << "while T" << w2 <<" is True jump to label " << w4  << "\n" << endl;
			//pcode[ptop].num2 = w4;
			pcode.at(ptop).num2 = w4;
			pcode_DAG.at(pcode_DAG.size()-1).num2 = w4;
		}
		else if(w3 == 1){
			outf << "if T" << w2 <<" is False jump to label " << w4 << "\n" << endl;
			//pcode[ptop].num2 = w4;
			//pcode[ptop].num2 *= -1;
			pcode.at(ptop).num2 = w4;
			pcode.at(ptop).num2 *= -1;
			pcode_DAG.at(pcode_DAG.size()-1).num2 = w4;
			pcode_DAG.at(pcode_DAG.size()-1).num2 *= -1;
		}
		else if(w3 == 2){
			outf << "if T" << w2 <<" is False jump to label " << w4 << "\n" << endl;
		}
	}
	else if(w1 == "label"){
		outf << endl;
		outf << "label " << w4 << ":" << endl;
	}
	else if(w1 == "ret"){
		if(w4 <0 ){
			outf << "nothing to return"<<endl;
		}
		else{
			outf << "The Return Value Saved in T" << w3 << endl;
		}
	}
	else if(w1 == "case"){
		outf << "if T" << w2 << " != " << w3 <<"  jump to label " << w4 << endl;
	}
	else if(w1 == "pr"){
		if(w2 == 0){
			if(w3 == 0){
				outf << "Print Num T" << w4 << endl;
			}
			else{
				outf << "Print Char T" << w4 << "(ASCLL)"<< endl;
			}
		}
		else{
			if(w3 == 0){
				outf << "Print Num T" << w4 << endl;
			}
			else{
				outf << "Print Char T" << w4 << "(ASCLL)"<< endl;
			}
		}
	}
	else if(w1 == "endfunc"){
		if(w3 < 0){
			outf << "Program Finished" << endl;
		}
		else if(w4 < 0){
			outf << "Did not return Success When you see this!" << endl;
		}
		else{
			outf << "void return" << endl;
		}
	}
}

void ZJ::midcode(std::string w1,int w2,int w3,std::string w4){
	ptop++;
	PCode pc_new;
	pc_new.str = w4;
	pc_new.num2 = w2;
	pc_new.num3 = w3;
	pcode.push_back(pc_new);
	if(w1 == "="){
		DAG.push_back(pc_new);
	}
	else{
		deal_Dag();
		int dag_count = 0;
		while(dt.dt_zjdm_GetBack_judge(dag_count)){
			PCode pc = dt.dt_zjdm_GetBack(dag_count);
			pcode_DAG.push_back(pc);
			dag_count++;
		}
		pcode_DAG.push_back(pc_new);
	}
	midcode_deal(w1,w2,w3,w4,outf);
	midcode_deal(w1,-1*w2,w3,w4,outf_DAG);
}

void ZJ::midcode_deal(std::string w1,int w2,int w3,std::string w4,std::ofstream & outf){
	extern Error error;
	int dag_judge = 1;
	if(w2 < 0){
		w2 *= -1;
		dag_judge = 0;
	}
	if(w1 == "=" && dag_judge){
		//pcode[ptop].num1 = -1;
		pcode.at(ptop).num1 = -1;
		DAG.at(DAG.size()-1).num1 = -1;
		/*
		-3  w4 = str2
		-2  w4 = w2
		-1	w4 = T2
		0	T2 = w4
		1	T2 = T2 + w4
		2	T2 = T2 - w4
		3	T2 = T2 * w4
		4	T2 = T2 / w4
		*/
		if(w3 == -1){
			outf << w4 << " = T"<< w2 <<endl;
		}
		else if(w3 == 0){
			outf << "T" << w2 << " = "<< w4 <<endl;
		}
		else if(w3 == 1){
			outf << "T" << w2 << "+= "<< w4 << endl;
		}
		else if(w3 == 2){
			outf << "T" << w2 << "-= "<< w4 << endl;
		}
		else if(w3 == 3){
			outf << "T" << w2 << "*= "<< w4 << endl;
		}
		else if(w3 == 4){
			outf << "T" << w2 << "/= "<< w4 << endl;
		}
		else{
			error.PrintError(-501,-1,-1);
		}
	}
	else if(w1 == "const"){
		//pcode[ptop].num1 = -2;
		pcode.at(ptop).num1 = -2;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -2;
		if(w2 == 0){
			outf << "const int " << w4 << " = " << w3 << endl;
		}
		else{
			outf << "const char " << w4 << " = " << w3 << " (ASCLL)" << endl;
		}
	}
	else if(w1 == "para"){
//		pcode[ptop].num1 = -3;
		pcode.at(ptop).num1 = -3;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -3;
		outf << "Sending Parametor #" << w3 <<" : T"<< w2 << "    to Function " << w4 << endl;
	}
	else if(w1 == "paraneed"){
		//pcode[ptop].num1 = -4;
		pcode.at(ptop).num1 = -4;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -4;
		outf << "Need Parametor #" << w2 << "-- " << w4 << endl;
	}
	else if(w1 == "=()"){
		/*
		w3	3 mul
			4 div
			2 assign
		*/
		//pcode[ptop].num1 = -5;
		pcode.at(ptop).num1 = -5;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -5;
		if(w3 == 2){
			outf << "T" << w2 << " = Return_" << w4 << "()" << endl;
		}
		else if(w3 == 3){
			outf << "T" << w2 << " *= Return_" << w4 << "()" << endl;
		}
		else if(w3 == 4){
			outf << "T" << w2 << " /= Return_" << w4 << "()" << endl;
		}
	}
	else if(w1 == "=[]"){
//		pcode[ptop].num1 = -6;
		pcode.at(ptop).num1 = -6;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -6;
		if(w3 <0){
			w3 *= -1;
			w3 -= 1;
			outf << "T" << w2 << " /= " << w4 << "[T" << w3 << "]" << endl;
		}
		else{
			outf << "T" << w2 << " *= " << w4 << "[T" << w3 << "]" << endl; 
		}
	}
	else if(w1 == "[]"){
//		pcode[ptop].num1 = -7;
		pcode.at(ptop).num1 = -7;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -7;
		if(w2 == 7){//int var[]
			outf << "int " << w4 << "[" << w3 << "]" << endl;
		}
		else{
			outf << "char " << w4 << "[" << w3 << "]" << endl;
		}
	}
	else if(w1 == "var"){
//		pcode[ptop].num1 = -8;
		pcode.at(ptop).num1 = -8;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -8;
		if(w2 == 5){
			outf << "int " << w4 << endl;
		}
		else{
			outf << "char " << w4 << endl;
		}
	}
	else if(w1 == "func"){
		//pcode[ptop].num1 = -9;
		pcode.at(ptop).num1 = -9;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -9;
		outf << endl;
		outf << w4 << ":" << endl;
	}
	else if(w1 == "sc"){
		//pcode[ptop].num1 = -10;
		pcode.at(ptop).num1 = -10;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -10;
		if(w3 == 1){
			outf << w4 << " = Readin(int)"<< endl;
		}
		else{
			outf << w4 << " = Readin(char)"<< endl;
		}
	}
	else if(w1 == "pr"){
		//pcode[ptop].num1 = -11;
		pcode.at(ptop).num1 = -11;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -11;
		if(w2 == 0){
			outf << "Print String " << w4;
		}
		else{
			outf << endl;
		}
	}
	else if(w1 == "()"){
//		pcode[ptop].num1 = -12;
		pcode.at(ptop).num1 = -12;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -12;
		outf << "Calling " << w4 << "()" << endl;
	}
	else if(w1 == "[]="){
		//pcode[ptop].num1 = -13;
		pcode.at(ptop).num1 = -13;
		pcode_DAG.at(pcode_DAG.size()-1).num1 = -13;
		outf << w4 << "[T" << w2  <<"] = T" << w3 << endl; 
	}
}