#pragma once

#include<iostream>
#include<fstream>
#include<string>
#include"metaphysics.h"

class Error{
	private:
		std::ofstream error_log;
	public:
		Error();
		void PrintError(int errorID,int line, int column);
};
