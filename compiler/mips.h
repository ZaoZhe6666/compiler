#pragma once

#include<iostream>
#include<fstream>
#include<stack>
#include<string>
#include"metaphysics.h"
#include"table.h"
#include"error.h"

#define CODEMAX 2048
#define STRINGMAX 128

class MIPS{
	private:
		std::ofstream outf;
		int StringNum;
		int const_init_judge;
		int global_judge;
		std::string s_list[STRINGMAX];
		std::string deal_func;
	public:
		int main_judge;
		MIPS();
		void mid2mips(PCode pcode);
		int getnum(std::string name);
		int string_save(std::string name);
		void string_init();
		void const_init(std::string name,int value);
		void global_init(std::string name,int wide);
		int getLocation(std::string name);
		int getLocation(int value);
};