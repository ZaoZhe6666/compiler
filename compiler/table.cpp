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
	outf.open("out_DagTable.txt");
}

int DT::dt_seek(std::string str){
	outf << "\t\tSEEK IDENT " << str <<endl;
	int i;
	int top = s1->dt.size();
	for(i=0;i<top;i++){
		if(s1->dt.at(i).name == str){
			return i;
		}
	}
	return -1;
}

int DT::dt_seek(std::string str,int n){
	outf << "\t\tSEEK TEMP T" << n <<endl;
	int i;
	int top = s1->dt.size();
	for(i=0;i<top;i++){
		if(s1->dt.at(i).name == "T" && s1->dt.at(i).value == n){
			return i;
		}
	}
	return -1;
}

int DT::dt_seek(int n){
	outf << "\t\tSEEK CONST " << n <<endl;
	int i;
	int top = s1->dt.size();
	for(i=0;i<top;i++){
		if(s1->dt.at(i).name == "CONST" && s1->dt.at(i).value == n){
			return i;
		}
	}
	return -1;
}

int DT::dt_seek(std::string relate,int left,int right){
	outf << "\t\tSEEK RELATE " << left << " " << relate << " " << right <<endl;
	int i;
	int top = s2->drt.size();
	for(i=0;i<top;i++){
		if(s2->drt.at(i).relate == relate && s2->drt.at(i).left == left && s2->drt.at(i).right == right){
			return s2->drt.at(i).mid;
		}
	}
	return 0;
}

int DT::dt_create_point(std::string name,int value){
	DagPoint dp;
	dp.left = 0;
	dp.right = 0;
	dp.value = value;
	dp.name = name;
	dp.loc = ++s1->topnum;
	s1->dt.push_back(dp);
	if(name == "T"){
		outf << "CREATE POINT #"  << s1->topnum << "  T" << value <<endl;
	}
	else if(name == "CONST"){
		outf << "CREATE POINT #"  << s1->topnum << "  CONST  " << value <<endl;
	}
	else{
		outf << "CREATE POINT #"  << s1->topnum << "  " << name <<endl;
	}
	return dp.loc;
}

void DT::dt_change_point_value(int point_index, int loc){
	s1->dt.at(point_index).loc = loc;
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
	dp.name = relate;
	dp.value = 0;
	s1->dt.push_back(dp);
	outf << "CREATE POINT #"  << s1->topnum << " " << relate <<endl;
	s2->drt.push_back(new_relate);
	outf << "CREATE RELATE #" << left << "--- " << relate << "(#" << s1->topnum << ") ---#" << right <<endl;
	return dp.loc;
}

void DT::dt_delete_relate(){
	outf << "########## END DAG ##########" << endl;
	s1->dt.clear();
	s1->topnum = 0;
	s2->drt.clear();
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