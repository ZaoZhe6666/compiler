#pragma once

#include<iostream>
#include<fstream>
#include<string>
#include"cffx.h"
#include"metaphysics.h"
#include"table.h"
#include"error.h"

#define MAXSTACKNUM 2048

class YF{
	private:
		CF* cf;
		ST* st;
		FT* ft;
		std::ofstream outf;
		char ch;
		int line,column,symID;
		int curline;
		int parID;
		std::string token;
		char pairstack[MAXSTACKNUM];
		int pstnum;
	public:
		YF(std::string filename);
		void getSym();
		void error(int errorID);
		void mustread(int symID);
		void p(std::string word);
	  //�ӷ������		�˷������		��ϵ�����
		void plus();	void mult();	int relate();
	  //��ĸ			����			��������
		void letter();	void num();		void nznum();
	  //�ַ�			�ַ���			����
		int chara();	void strin();	void program();
	  //����˵��		��������		�޷�������
		void conexp();	void condef(int type);	int nfint();
	  //����			��ʶ��			����ͷ��
		int inty();	void ident();	void prohead();
	  //����˵��		��������							���ͱ�ʶ��
		void varexp(int level);	void vardef(int type,int level,int ident);	void typeind();
	  //�з���ֵ����					�޷���ֵ����	�������
		void rfunc(int type,int ident);	void nrfunc(int ident);	void conplex();
	  //������					������			���ʽ
		void paratab(int com); void mfunc();	void express(int ident);
	  //��				����			���
		void term();	void factor(int ident);	void senten();
	  //��ֵ���		�������		����
		void evalue();	void condsen();	void condit();
	  //ѭ�����		����			������
		void loopsen();	void consty();	void casesen();
	  //�����			��������		�з���ֵ�����������
		void casetab();	void case3sen();void rfcall();
	  //�޷���ֵ�������� ֵ������		�����
		void nrfcall();	void valpatab();void senlist();
	  //�����			д���			�������
		void readsen();	void printsen();void retsen();
};