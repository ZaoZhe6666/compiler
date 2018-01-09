#pragma once

#include<iostream>
#include<fstream>
#include<string>
#include"metaphysics.h"
#include"table.h"
#include"error.h"
#include<vector>
#define MAXPCODENUM 8184

class ZJ{
	private:
		std::ofstream outf;
		std::ofstream outf_DAG;
		std::string token;
//		PCode pcode[MAXPCODENUM];
		std::vector<PCode> pcode;
//		PCode pcode_DAG[MAXPCODENUM];
		std::vector<PCode> DAG;
		std::vector<PCode> pcode_DAG;
	public:
		int label_num;
		int ptop;
		ZJ();
		PCode getcode(int num);
		void deal_Dag();
		void midcode(std::string w1,int w2,int w3,int w4);
		void midcode(std::string w1,int w2,int w3,std::string w4);
};