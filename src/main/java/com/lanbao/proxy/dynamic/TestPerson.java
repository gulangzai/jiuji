package com.lanbao.proxy.dynamic;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;

public class TestPerson {
	
	TestPerson(){ 
	     PersonInter personInter = (PersonInter)Proxy.newProxyInstance(PersonInter.class.getClassLoader(), new Class[]{PersonInter.class}, new DynaProxyHandler(new Person()));
		 personInter.work();
	}
	public static void main(String[] args) {
		 new TestPerson();
	}
}
