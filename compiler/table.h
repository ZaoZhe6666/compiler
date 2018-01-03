#pragma once

#include<iostream>
#include<fstream>
#include<stack>
#include<string>
#include"metaphysics.h"
#include"error.h"

#define MAXSIZE 1024

struct PCode{
	int num1;
	int num2;
	int num3;
	std::string str;
};

struct Func{
	std::string name;
	int para;
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
		//��ջ����
		int ft_push(std::string name,int para);
		void ft_add(int para);
		//��ѯ����
		int ft_para(std::string name);
		int ft_last_para();
		int ft_conf(std::string name);
		int ft_size();
};

struct Symbol{
	std::string name;
	int level;
	/*	
		0	����
		1	����
		2	��������
		3	�����ڶ������
	*/
	int type;
	/*  
		0	void func	�޷���ֵ����
		1	int func	����int����
		2	char func	����char����
		3	const int	int����
		4	const char	char����
		5	int			int����
		6	char		char����
		7	int[]		int����
		8	char[]		char����
		9	temp		�м����
	*/
	int value;
	int location;
};

struct SymTable{
	Symbol symbol[MAXSIZE];
	int top;
};

class ST{
	private:
		std::ofstream outf;
		SymTable *s;
		int const_sp;
		int const_judge;
	public:
		ST();
		//����ջ����
		int st_push(std::string name,int level,int type,int value);
		void st_pop(int level);
		//��ѯ����
		int st_seek(std::string name,int push_or_pop);
		int st_size();
		int st_loc(int weight);
		int st_weight();
		void st_change(int value);
		int get_loc(std::string func_name,std::string sym_name,int value);
		int getpara_offset(std::string name);
		int st_func_type(std::string name);
		int array_length(std::string name);
};
