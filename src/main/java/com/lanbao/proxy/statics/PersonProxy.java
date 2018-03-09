package com.lanbao.proxy.statics;

public class PersonProxy implements PersonInter{
	
	PersonInter personInter;
	
	PersonProxy(PersonInter personInter){
		this.personInter = personInter;
	}

	@Override
	public void work() {
		// TODO Auto-generated method stub
	    System.out.println("我打开电脑");
	    personInter.work();
	    System.out.println("我关闭电脑");
	}
	 
}
