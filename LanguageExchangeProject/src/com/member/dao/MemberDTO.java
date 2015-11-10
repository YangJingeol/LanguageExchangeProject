package com.member.dao;

import java.util.Date;

public class MemberDTO {
   private String email;
   private String pwd;
   private String name;
   private String nickname;
   private int age;
   private String sex;
   private String nation;
   private String tel;
   private String language;
   private String pname;
   private String lang;
   private int psize;
   public String getLanguage() {
      return language;
   }
   public String getLang() {
      return lang;
   }
   public void setLang(String lang) {
      this.lang = lang;
   }
   public void setLanguage(String language) {
      this.language = language;
   }
   public String getPname() {
      return pname;
   }
   public void setPname(String pname) {
      this.pname = pname;
   }
   public int getPsize() {
      return psize;
   }
   public void setPsize(int psize) {
      this.psize = psize;
   }

   private String intro;
      private char admin;

   public char getAdmin() {
      return admin;
   }
   public void setAdmin(char admin) {
      this.admin = admin;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPwd() {
      return pwd;
   }
   public void setPwd(String pwd) {
      this.pwd = pwd;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getSex() {
      return sex;
   }
   public void setSex(String sex) {
      this.sex = sex;
   }
   public String getNation() {
      return nation;
   }
   public void setNation(String nation) {
      this.nation = nation;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }

   public String getIntro() {
      return intro;
   }
   public void setIntro(String intro) {
      this.intro = intro;
   }

   public int getAge() {
      return age;
   }
   public void setAge(int age) {
      this.age = age;
   }

   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
}