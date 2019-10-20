PGDMP         3            	    w           sql-challenge    11.5    11.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    49161    sql-challenge    DATABASE     �   CREATE DATABASE "sql-challenge" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "sql-challenge";
             postgres    false            �            1259    49206    dept    TABLE     k   CREATE TABLE public.dept (
    dept_no character varying NOT NULL,
    dept_name character(30) NOT NULL
);
    DROP TABLE public.dept;
       public         postgres    false            �            1259    49246    dept_emp    TABLE     �   CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying NOT NULL,
    from_date character varying(20) NOT NULL,
    to_date character varying(20) NOT NULL
);
    DROP TABLE public.dept_emp;
       public         postgres    false            �            1259    49262    dept_mgr    TABLE     �   CREATE TABLE public.dept_mgr (
    dept_no character varying NOT NULL,
    emp_no integer NOT NULL,
    from_date character varying(20) NOT NULL,
    to_date character varying(20) NOT NULL
);
    DROP TABLE public.dept_mgr;
       public         postgres    false            �            1259    49214    emp    TABLE       CREATE TABLE public.emp (
    emp_no integer NOT NULL,
    birth_date character varying(20) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    gender character varying(5) NOT NULL,
    hire_date character varying(20) NOT NULL
);
    DROP TABLE public.emp;
       public         postgres    false            �            1259    49219    salary    TABLE     �   CREATE TABLE public.salary (
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date character varying(20) NOT NULL,
    to_date character varying(20) NOT NULL
);
    DROP TABLE public.salary;
       public         postgres    false            �            1259    49235    titles    TABLE     �   CREATE TABLE public.titles (
    emp_no integer NOT NULL,
    title character varying NOT NULL,
    from_date character varying(20) NOT NULL,
    to_date character varying(20) NOT NULL
);
    DROP TABLE public.titles;
       public         postgres    false            �
           2606    49269    dept_mgr dept_mgr_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.dept_mgr
    ADD CONSTRAINT dept_mgr_pkey PRIMARY KEY (dept_no, emp_no);
 @   ALTER TABLE ONLY public.dept_mgr DROP CONSTRAINT dept_mgr_pkey;
       public         postgres    false    201    201            �
           2606    49213    dept dept_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_pk PRIMARY KEY (dept_no);
 6   ALTER TABLE ONLY public.dept DROP CONSTRAINT dept_pk;
       public         postgres    false    196            �
           2606    49218    emp empno_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.emp
    ADD CONSTRAINT empno_pk PRIMARY KEY (emp_no);
 6   ALTER TABLE ONLY public.emp DROP CONSTRAINT empno_pk;
       public         postgres    false    197            �
           2606    49257    dept_emp dept_emp_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.dept(dept_no);
 H   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_dept_no_fkey;
       public       postgres    false    200    196    2708            �
           2606    49252    dept_emp dept_emp_emp_no_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.emp(emp_no);
 G   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_emp_no_fkey;
       public       postgres    false    200    197    2710            �
           2606    49222    salary salary_emp_no_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.salary
    ADD CONSTRAINT salary_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.emp(emp_no);
 C   ALTER TABLE ONLY public.salary DROP CONSTRAINT salary_emp_no_fkey;
       public       postgres    false    2710    197    198            �
           2606    49241    titles titles_emp_no_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.emp(emp_no);
 C   ALTER TABLE ONLY public.titles DROP CONSTRAINT titles_emp_no_fkey;
       public       postgres    false    2710    197    199           