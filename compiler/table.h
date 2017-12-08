#pragma once

#include<iostream>
#include<fstream>
#include<stack>
#include<string>
#include"metaphysics.h"
#include"error.h"

#define MAXSIZE 2048


struct Func{
	std::string name;
	std::string para;
};

struct FuncTable{
	Func func[MAXSIZE];
	int top;
};

class FT{
	private:
		std::ofstream outf;
		FuncTable *s;
	public:
		FT();
		//入栈操作
		int ft_push(std::string name,std::string para);
		void ft_add(std::string para);
		//查询查找
		int ft_seek(std::string name,std::string para);
		int ft_size();
};

struct Symbol{
	std::string name;
	int level;
	/*	
		0	常量
		1	函数
		2	函数参数
		3	函数内定义变量
	*/
	int type;
	/*  
		0	void func	无返回值函数
		1	int func	返回int函数
		2	char func	返回char函数
		3	const int	int常量
		4	const char	char常量
		5	int			int变量
		6	char		char变量
		7	int[]		int数组
		8	char[]		char数组
	*/
	int value;
};

struct SymTable{
	Symbol symbol[MAXSIZE];
	int top;
};

class ST{
	private:
		std::ofstream outf;
		SymTable *s;
	public:
		ST();
		//出入栈操作
		int st_push(std::string name,int level,int type,int value);
		void st_pop(int level);
		//查询操作
		int st_seek(std::string name);
		int st_size();
		void st_change(int value);
};