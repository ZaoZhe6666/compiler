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

int FT::ft_push(std::string name,std::string para){
	cout << "PUSH IN FUNCTABLE #" << s->top+1;
	cout << " " << name << " " << para << endl;
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

void FT::ft_add(std::string para){
	if(s->top<0){
		return;
	}
	s->func[s->top].para += para;
}

int FT::ft_seek(std::string name,std::string para){
	int i;
	for(i=0;i<=s->top;i++){
		if(s->func[i].name == name){
			if(s->func[i].para == para){
				return 1;
			}
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
	outf << "PUSH IN SymTable: #" << (s->top+1) << "  " << name << "  ";
	outf <<level<<"  "<<type<< "  " <<value <<endl; 
	if(s->top+1>MAXSIZE){
		outf << "Stack is full??" << endl;
		return 0;
	}
	Symbol *new_sym;
	if(new_sym = new Symbol){
		new_sym->name = name;
		new_sym->level = level;
		new_sym->type = type;
		new_sym->value = value;
		s->symbol[++s->top] = *new_sym;
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

int ST::st_seek(std::string name){
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
	outf << "Change to" << " type:"<< s->symbol[s->top].type << " value:" << value << endl;
}