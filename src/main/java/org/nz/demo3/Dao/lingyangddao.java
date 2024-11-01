package org.nz.demo3.Dao;

import org.nz.demo3.domain.lingyangdomain;

import java.util.ArrayList;

public interface lingyangddao {
    ArrayList<lingyangdomain> SelectAll(int age,String sex,String a,String b);
}
