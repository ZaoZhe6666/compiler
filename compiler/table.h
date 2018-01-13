#pragma once

#include<iostream>
#include<fstream>
#include<stack>
#include<string>
#include<vector>
#include"metaphysics.h"
#include"error.h"

#define MAXSIZE 1024

struct PCode{
	int num1;
	int num2;
	int num3;
	std::string str;
};

struct DagPoint{
	std::string name;
	//�ڵ�ָ������ҽڵ㣬������Ϊ0
	int left;
	int right;
	//�ڵ�ĸ��ڵ����
	int fatnum;
	//�ڵ��ֵ
	int value;
	//�ڵ��Ӧ�����
	int loc;
	//�ڵ��Ƿ�Ϊ�м�ڵ� 0-�м�ڵ� 1-���սڵ�
	int fin_or_temp;
};

struct DagTable{
	std::vector<DagPoint> dt;
	int topnum;
};

struct DagRelate{
	std::string relate;
	int left;
	int right;
	int mid;
};

struct DagRelateTable{
	std::vector<DagRelate> drt;
};

class DT{
	private:
		std::ofstream outf;
		DagTable *s1;
		DagRelateTable *s2;
	public:
		DT();
		//�жϱ����Ƿ���dag����
		int dt_seek(std::string str);
		//�жϼĴ����Ƿ���dag����
		int DT::dt_seek(std::string str,int n);
		//�жϳ���int/char�Ƿ���dag����
		int dt_seek(int n);
		//�жϹ�ϵleft relate right�Ƿ��ڹ�ϵ����
		int dt_seek(std::string relate,int left,int right);

		//�����µ�DAGͼ�й����ڵ�
		int dt_create_point(std::string name,int value);
		//�޸�dag���мĴ���ָ��λ��
		void dt_change_point_value(int point_index, int loc);
		//����DAGͼ�й�ϵ�ڵ�
		int dt_create_relate(std::string relate,int left,int right);
		void dt_delete_relate();
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
