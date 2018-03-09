package com.lanbao.proxy.statics;

public class TestPerson {
	
	public static void main(String[] args) {
		PersonInter person = new PersonProxy(new Person());
		person.work();
	}
}
