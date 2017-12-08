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
		ZJ();
};