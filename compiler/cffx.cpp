#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"cffx.h"
#include"error.h"

#define SPECWORDNUM 13
#define OUTWORDNUM 38
using namespace std;

char *SpecWord[SPECWORDNUM]={"const",	"int",		"char",		
							 "void",	"main",		"do",
							 "while",	"switch",	"case",		"if",
							 "scanf",	"printf",	"return",
							 }; 
char *OutWord[OUTWORDNUM]={"const",			"int",				"char",		
							 "void",		"main",				"do",
							 "while",		"switch",			"case",		"if",	
							 "scanf",		"printf",			"return",
							"plus",				"sub",
							 "mult",		"div",				"great",
							 "less",		"great or equal",	"less or equal",
							 "equal",		"not equal",		"comma",
							 "semi",		"assign",			"single quota",
							 "double quota","colon",			"number",
							 "string",		"left parent",		"right parent",
							 "left brack",	"right brack",		"left brace",
							 "right brace",	"identifier"
							}; 

CF::CF(string filename){
	inf.open(filename.c_str());
	outf.open("out_cf.txt");
	ch=' ';
	line_num=1;
	symID=0;
	line_point =0;
	column_num=1;
	token="";
	if(!inf.is_open()){
		cout << "Couldn't open the file!" <<endl;
		exit(0);
	}
}

int CF::cutword(char c){ 
    if(c == ' ' || c == '\t' || c=='\n' || c=='\r' || c==EOF){ 
        return 1;
    }
    if(c==',' || c==';' || c=='=' ){
        return 2;
    }
    if(c==']' || c==')'){
        return 3;
    }
    if(c=='+' || c=='-' || c=='*' || c=='/'){
        return 4;
    }
	if(c==':'){
		return 5;
	}
    return 0;
}
bool CF::isspace(){
    if(ch == ' ' || ch == '\t' || ch=='\n' || ch=='\r'){
        return true;
    }
    return false;
}
bool CF::ischar(){
	if(ch>='a' && ch<='z'){
		return true;
	}
	if(ch>='0' && ch<='9'){
		return true;
	}
	if(ch == '_'){
		return true;
	}
	return false;
}
bool CF::isascll(){
	if(ch >= 32 && ch <= 33){
		return true;
	}
	if(ch >= 35 && ch <= 126){
		return true;
	}
	return false;
}
void CF::getchar_cf(){
	line_point++;
	ch = inf.get();
	if(ch == '\n'){
		line_point=0;
	}
	if(ch == '\t'){
		line_point+=3;
	}
	if(ch>='A' && ch<='Z'){
		ch = ch - 'A' + 'a';
	} 
	return;
}
string CF::getSym(){
	token = "";
	symID=0;
	while(isspace()){
		if(ch == '\n'){
			line_num++;
		}
		getchar_cf();
	}
	column_num = line_point;
	if(ch == EOF){
		symID = -1;
		return token;
	}
	if((ch>= 'a' && ch<='z')|| ch == '_'){
		//Read the string
		int i=0;
		do{
			token+=ch;
			getchar_cf();
		}while(ischar());
		//compare with the spec word
		for(i=0;i<SPECWORDNUM;i++){
			if(strcmp(SpecWord[i],token.c_str())==0){
				symID = i;
				break;
			}
		}
		if(i == SPECWORDNUM){
			symID = IDENTSY;
		}
	}
	else if(ch>='0' && ch<='9'){
		int i = 0;
		do{
			token+=ch;
			getchar_cf();
		}while(ch>='0' && ch <= '9');
		if(cutword(ch)){
			symID = NUMBERSY;
		}
		else{
			symID = -3;
		}
	}
	else{
		switch(ch){
			case '+':{
				symID = PLUSSY;
				token += ch;
				getchar_cf();
				break;
			}
			case '-':{
				symID = SUBSY;
				token += ch;
				getchar_cf();
				break;
			}
			case '*':{
				symID = MULTSY;
				token += ch;
				getchar_cf();
				break;
			}
			case '/':{
				symID = DIVSY;
				token += ch;
				getchar_cf();
				break;
			}
			case ',':{
				symID = COMMASY ;
				token += ch;
				getchar_cf();
				break;
			}
			case ':':{
				symID = COLONSY;
				token += ch;
				getchar_cf();
				break;
			}
			case ';':{
				symID = SEMISY;
				token += ch;
				getchar_cf();
				break;
			}
			case '<':{
				token += ch;
				getchar_cf();
				if(ch == '='){
					symID = LESY;
					token += ch;
					getchar_cf();
				}
				else{
					symID = LESSSY;
				}
				break;
			}
			case '>':{
				token += ch;
				getchar_cf();
				if(ch == '='){
					symID = GESY;
					token += ch;
					getchar_cf();
				}
				else{
					symID = GREATSY;
				}
				break;
			}
			case '!':{
				token += ch;
				getchar_cf();
				if(ch == '='){
					token += ch;
					symID = NESY;
					getchar_cf();
				}
				else{
					symID = -2;
				}
				break;
			}
			case '=':{
				token += ch;
				getchar_cf();
				if(ch == '='){
					token += ch;
					symID = EQUALSY;
					getchar_cf();
				}
				else{
					symID = ASSIGNSY;
				}
				break;
			}
			case '\'':{
				ch = inf.get();
				line_point++;
				char c0 = ch;
				if(isascll()){
					ch = inf.get();
					line_point++;
					if(ch == '\''){
						token += c0;
						symID = SQUTASY;
						getchar_cf();
					}
					else{
						token+=c0;
						while(!(ch == EOF || ch == '\'' || ch == '\n' || ch == '\r')){
							token+=ch;
							ch = inf.get();
							line_point++;
						}
						if(ch == '\''){
							getchar_cf();
						}
						symID = -4;
					}
				}
				else{
					token+=c0;
					ch = inf.get();
					while(!(ch == EOF || ch == '\'' || ch == '\n' || ch == '\r')){
						token+=ch;
						ch = inf.get();
						line_point++;
					}
					if(ch == '\''){
						getchar_cf();
					}
					symID = -5;
				}
				break;
			}
			case '\"':{
				ch = inf.get();
				line_point++;
				while(!(ch == EOF || ch == '\"' || ch=='\r' || ch == '\n')){
					token+=ch;
					ch = inf.get();
					line_point++;
				}
				if(ch == '\"'){
					symID = STRINGSY;
					getchar_cf();
				}
				else{
					symID = -6;
				}
				break;
			}
			case '{':{
				symID = LBRACESY;
				token += ch;
				getchar_cf();
				break;
			}
			case '[':{
				symID = LBRACKSY;
				token += ch;
				getchar_cf();
				break;
			}
			case '(':{
				symID = LPARENTSY;
				token += ch;
				getchar_cf();
				break;
			}
			case ')':{
				symID = RPARENTSY;
				token += ch;
				getchar_cf();
				break;
			}
			case ']':{
				symID = RBRACKSY;
				token += ch;
				getchar_cf();
				break;
			}
			case '}':{
				symID = RBRACESY;
				token += ch;
				getchar_cf();
				break;
			}
			default:{
				token += ch;
				symID = -7;
				getchar_cf();
			}
		}
	}
//	cout << "token: " << token << "\t\tsymID: " << symID ;
	outf << "token: " << token << "\t\tsymID: " << symID ;
	if(symID>=0){
		outf << "\t\tSY:" << OutWord[symID];
	}
	else{
		extern Error error;
		error.PrintError(symID+1,line_num,column_num);
	}
//	cout << "\t\tline: "<< line_num << "\t\tcolumn:" << column_num << endl;
	outf << "\t\tline: "<< line_num << "\t\tcolumn:" << column_num << endl;
//	outf << "  " << ch <<endl; 
	return token;
}

int CF::getSymID(){
	return symID;
}

int CF::getline(){
	return line_num;
}

int CF::getcolumn(){
	return column_num;
}
