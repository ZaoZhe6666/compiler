#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"zjdm.h"
#include"error.h"

using namespace std;

ZJ::ZJ(){
	outf.open("out_zj.txt");
	label_num = -1;
}

void ZJ::midcode(std::string w1,int w2,int w3,int w4){
	extern Error error;
	if(w1 == "int"){

	}
	else if(w1 == "char"){

	}
	else if(w1 == "const"){

	}
	else if(w1 == "="){
		/*
		-1	T4 = T2
		0	T2 = T4
		1	T2 = T2 + T4
		2	T2 = T2 - T4
		3	T2 = T2 * T4
		4	T2 = T2 / T4
		*/
		if(w3 == 0){
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
			error.PrintError(-501,-1,-1);
		}
	}
	else if(w1 == "[]="){

	}
	else if(w1 == "=[]"){

	}
	else if(w1 == "=()"){

	}
	else if(w1 == "()"){

	}
	else if(w1 == "<" || w1 == "<=" || w1 == "==" ||
			w1 == ">" || w1 == ">=" || w1 == "!="){
		outf << "T" << w2 << " = T" << w2 << w1 << "T" << w4 << endl;
	}
	else if(w1 == "jmp"){
		outf << "if T" << w2 <<" is False jump to label " << w4 << endl;
	}
	else if(w1 == "label"){
		outf << endl;
		outf << "label " << w4 << ":" << endl;
	}
	else if(w1 == "ret"){
		if(w2 <0 ){
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
			cout << "Print Num" << w4 << endl;
		}
		else{
			cout << w4 << endl;
		}
	}
	else if(w1 == "endfunc"){
		if(w2 < 0){
			outf << "Did not return Success When you see this!" << endl;
		}
		else{
			outf << "void return" << endl;
		}
	}
	else if(w1 == "par"){

	}
}

void ZJ::midcode(std::string w1,int w2,int w3,std::string w4){
	extern Error error;
	if(w1 == "="){
		/*
		-1	T4 = T2
		0	T2 = T4
		1	T2 = T2 + T4
		2	T2 = T2 - T4
		3	T2 = T2 * T4
		4	T2 = T2 / T4
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
		if(w2 == 0){
			outf << "const int " << w4 << " = " << w3 << endl;
		}
		else{
			outf << "const char " << w4 << " = " << w3 << " (ASCLL)" << endl;
		}
	}
	else if(w1 == "para"){
		outf << "Sending Parametor #" << w3 <<" : T"<< w2 << "    to Function " << w4 << endl;
	}
	else if(w1 == "paraneed"){
		outf << "Need Parametor #" << w2 << "-- " << w4 << endl;
	}
	else if(w1 == "=()"){
		if(w3 == 3){
			outf << "T" << w2 << " *= Calling " << w4 << "()" << endl;
		}
		else{
			outf << "T" << w2 << " /= Calling " << w4 << "()" << endl;
		}
	}
	else if(w1 == "=[]"){
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
		if(w2 == 7){//int var[]
			outf << "int " << w4 << "[" << w3 << "]" << endl;
		}
		else{
			outf << "char " << w4 << "[" << w3 << "]" << endl;
		}
	}
	else if(w1 == "var"){
		if(w2 == 5){
			outf << "int " << w4 << endl;
		}
		else{
			outf << "char " << w4 << endl;
		}
	}
	else if(w1 == "func"){
		outf << endl;
		outf << w4 << ":" << endl;
	}
	else if(w1 == "sc"){
		outf << w4 << " = Readin()"<< endl;
	}
	else if(w1 == "pr"){
		if(w2 == 0){
			outf << "Print String " << w4;
		}
		else{
			outf << endl;
		}
	}
}