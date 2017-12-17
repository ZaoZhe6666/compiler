#pragma once

#include<iostream>
#include<fstream>
#include<string>
#include"metaphysics.h"
#include"table.h"
#include"error.h"
#define MAXPCODENUM 8184

class ZJ{
	private:
		std::ofstream outf;
		std::string token;
		PCode pcode[MAXPCODENUM];
	public:
		int label_num;
		int ptop;
		ZJ();
		PCode getcode(int num);
		void midcode(std::string w1,int w2,int w3,int w4);
		void midcode(std::string w1,int w2,int w3,std::string w4);
};