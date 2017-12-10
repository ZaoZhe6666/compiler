#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"mips.h"
#include"error.h"

using namespace std;

MIPS::MIPS(){
	outf.open("mips.asm");
	outf << ".data" << endl;
}

