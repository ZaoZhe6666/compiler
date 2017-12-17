#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"table.h"
#include"error.h"

using namespace std;

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
	outf.open("out_SymTable.txt");
}

int ST::st_push(std::string name,int level,int type,int value){
	if(s->top+1>MAXSIZE){
		outf << "Stack is full??" << endl;
		return 0;
	}
	int i;
//	outf << "name:" << name << "  level:" << level <<endl;
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
		if(s->symbol[i].level == 0 && level && name != "T"){
			break;
		}
		if(s->symbol[i].level == 1 && level && name != "T"){
			if(s->symbol[i].name == name){
				cout << "same name!" << endl;
				return 0;
			}
			break;
		}
		if(s->symbol[i].name == name && name != "T"){
			cout << "same name!" << endl;
			return 0;
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