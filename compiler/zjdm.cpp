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
	else if(w1 == "<"){

	}
	else if(w1 == "<="){

	}
	else if(w1 == "=="){

	}
	else if(w1 == "!="){

	}
	else if(w1 == ">="){

	}
	else if(w1 == ">"){

	}
	else if(w1 == "jmp"){

	}
	else if(w1 == "ret"){

	}
	else if(w1 == "sc"){

	}
	else if(w1 == "pr"){

	}
	else if(w1 == "func"){

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
}