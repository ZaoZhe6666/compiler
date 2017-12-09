#pragma once

#include<iostream>
#include<fstream>
#include<string>
#include"metaphysics.h"
#include"error.h"

class ZJ{
	private:
		std::ofstream outf;
		std::string token;
	public:
		int label_num;
		ZJ();
		void midcode(std::string w1,int w2,int w3,int w4);
		void midcode(std::string w1,int w2,int w3,std::string w4);
};