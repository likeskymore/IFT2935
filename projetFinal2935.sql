PGDMP      )                }           aaaa    17.4    17.4 &    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            D           1262    16935    aaaa    DATABASE     j   CREATE DATABASE aaaa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE aaaa;
                     postgres    false            �            1259    16936 
   enseignant    TABLE       CREATE TABLE public.enseignant (
    idenseignant integer NOT NULL,
    nom character varying NOT NULL,
    prenom character varying NOT NULL,
    email character varying NOT NULL,
    telephone character varying NOT NULL,
    domaineens character varying NOT NULL
);
    DROP TABLE public.enseignant;
       public         heap r       postgres    false            �            1259    16941    enseignant_idenseignant_seq    SEQUENCE     �   CREATE SEQUENCE public.enseignant_idenseignant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.enseignant_idenseignant_seq;
       public               postgres    false    217            E           0    0    enseignant_idenseignant_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.enseignant_idenseignant_seq OWNED BY public.enseignant.idenseignant;
          public               postgres    false    218            �            1259    16942 
   entreprise    TABLE     F  CREATE TABLE public.entreprise (
    identreprise integer NOT NULL,
    nomentreprise character varying NOT NULL,
    adresse character varying NOT NULL,
    secteuractivitees character varying NOT NULL,
    telephone character varying NOT NULL,
    email character varying NOT NULL,
    stageanterieures character varying
);
    DROP TABLE public.entreprise;
       public         heap r       postgres    false            �            1259    16947    entreprise_identreprise_seq    SEQUENCE     �   CREATE SEQUENCE public.entreprise_identreprise_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.entreprise_identreprise_seq;
       public               postgres    false    219            F           0    0    entreprise_identreprise_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.entreprise_identreprise_seq OWNED BY public.entreprise.identreprise;
          public               postgres    false    220            �            1259    16948    etudiant    TABLE     "  CREATE TABLE public.etudiant (
    idetudiant integer NOT NULL,
    nom character varying NOT NULL,
    prenom character varying NOT NULL,
    birthdate date NOT NULL,
    email character varying NOT NULL,
    telephone character varying NOT NULL,
    filiere character varying NOT NULL
);
    DROP TABLE public.etudiant;
       public         heap r       postgres    false            �            1259    16953    etudiant_idetudiant_seq    SEQUENCE     �   CREATE SEQUENCE public.etudiant_idetudiant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.etudiant_idetudiant_seq;
       public               postgres    false    221            G           0    0    etudiant_idetudiant_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.etudiant_idetudiant_seq OWNED BY public.etudiant.idetudiant;
          public               postgres    false    222            �            1259    16954    stage    TABLE     @  CREATE TABLE public.stage (
    idstage integer NOT NULL,
    titrestage character varying NOT NULL,
    datedebut date NOT NULL,
    datefin date NOT NULL,
    etat character varying NOT NULL,
    datevisite date,
    idetudiant integer NOT NULL,
    identreprise integer NOT NULL,
    idenseignant integer NOT NULL
);
    DROP TABLE public.stage;
       public         heap r       postgres    false            �            1259    16959    stage_idstage_seq    SEQUENCE     �   CREATE SEQUENCE public.stage_idstage_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.stage_idstage_seq;
       public               postgres    false    223            H           0    0    stage_idstage_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.stage_idstage_seq OWNED BY public.stage.idstage;
          public               postgres    false    224            �           2604    16960    enseignant idenseignant    DEFAULT     �   ALTER TABLE ONLY public.enseignant ALTER COLUMN idenseignant SET DEFAULT nextval('public.enseignant_idenseignant_seq'::regclass);
 F   ALTER TABLE public.enseignant ALTER COLUMN idenseignant DROP DEFAULT;
       public               postgres    false    218    217            �           2604    16961    entreprise identreprise    DEFAULT     �   ALTER TABLE ONLY public.entreprise ALTER COLUMN identreprise SET DEFAULT nextval('public.entreprise_identreprise_seq'::regclass);
 F   ALTER TABLE public.entreprise ALTER COLUMN identreprise DROP DEFAULT;
       public               postgres    false    220    219            �           2604    16962    etudiant idetudiant    DEFAULT     z   ALTER TABLE ONLY public.etudiant ALTER COLUMN idetudiant SET DEFAULT nextval('public.etudiant_idetudiant_seq'::regclass);
 B   ALTER TABLE public.etudiant ALTER COLUMN idetudiant DROP DEFAULT;
       public               postgres    false    222    221            �           2604    16963    stage idstage    DEFAULT     n   ALTER TABLE ONLY public.stage ALTER COLUMN idstage SET DEFAULT nextval('public.stage_idstage_seq'::regclass);
 <   ALTER TABLE public.stage ALTER COLUMN idstage DROP DEFAULT;
       public               postgres    false    224    223            7          0    16936 
   enseignant 
   TABLE DATA           ]   COPY public.enseignant (idenseignant, nom, prenom, email, telephone, domaineens) FROM stdin;
    public               postgres    false    217   �.       9          0    16942 
   entreprise 
   TABLE DATA           �   COPY public.entreprise (identreprise, nomentreprise, adresse, secteuractivitees, telephone, email, stageanterieures) FROM stdin;
    public               postgres    false    219   0       ;          0    16948    etudiant 
   TABLE DATA           a   COPY public.etudiant (idetudiant, nom, prenom, birthdate, email, telephone, filiere) FROM stdin;
    public               postgres    false    221   M2       =          0    16954    stage 
   TABLE DATA           �   COPY public.stage (idstage, titrestage, datedebut, datefin, etat, datevisite, idetudiant, identreprise, idenseignant) FROM stdin;
    public               postgres    false    223   �3       I           0    0    enseignant_idenseignant_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.enseignant_idenseignant_seq', 1, false);
          public               postgres    false    218            J           0    0    entreprise_identreprise_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.entreprise_identreprise_seq', 1, false);
          public               postgres    false    220            K           0    0    etudiant_idetudiant_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.etudiant_idetudiant_seq', 1, false);
          public               postgres    false    222            L           0    0    stage_idstage_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.stage_idstage_seq', 10, true);
          public               postgres    false    224            �           2606    16965    enseignant enseignant_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.enseignant
    ADD CONSTRAINT enseignant_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.enseignant DROP CONSTRAINT enseignant_email_key;
       public                 postgres    false    217            �           2606    16967    enseignant enseignant_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.enseignant
    ADD CONSTRAINT enseignant_pkey PRIMARY KEY (idenseignant);
 D   ALTER TABLE ONLY public.enseignant DROP CONSTRAINT enseignant_pkey;
       public                 postgres    false    217            �           2606    16969    entreprise entreprise_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.entreprise
    ADD CONSTRAINT entreprise_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.entreprise DROP CONSTRAINT entreprise_email_key;
       public                 postgres    false    219            �           2606    16971    entreprise entreprise_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.entreprise
    ADD CONSTRAINT entreprise_pkey PRIMARY KEY (identreprise);
 D   ALTER TABLE ONLY public.entreprise DROP CONSTRAINT entreprise_pkey;
       public                 postgres    false    219            �           2606    16973    etudiant etudiant_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.etudiant
    ADD CONSTRAINT etudiant_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.etudiant DROP CONSTRAINT etudiant_email_key;
       public                 postgres    false    221            �           2606    16975    etudiant etudiant_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.etudiant
    ADD CONSTRAINT etudiant_pkey PRIMARY KEY (idetudiant);
 @   ALTER TABLE ONLY public.etudiant DROP CONSTRAINT etudiant_pkey;
       public                 postgres    false    221            �           2606    16977    stage stage_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_pkey PRIMARY KEY (idstage);
 :   ALTER TABLE ONLY public.stage DROP CONSTRAINT stage_pkey;
       public                 postgres    false    223            �           2606    16978    stage stage_idenseignant_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_idenseignant_fkey FOREIGN KEY (idenseignant) REFERENCES public.enseignant(idenseignant);
 G   ALTER TABLE ONLY public.stage DROP CONSTRAINT stage_idenseignant_fkey;
       public               postgres    false    4760    223    217            �           2606    16983    stage stage_identreprise_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_identreprise_fkey FOREIGN KEY (identreprise) REFERENCES public.entreprise(identreprise);
 G   ALTER TABLE ONLY public.stage DROP CONSTRAINT stage_identreprise_fkey;
       public               postgres    false    219    223    4764            �           2606    16988    stage stage_idetudiant_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_idetudiant_fkey FOREIGN KEY (idetudiant) REFERENCES public.etudiant(idetudiant);
 E   ALTER TABLE ONLY public.stage DROP CONSTRAINT stage_idetudiant_fkey;
       public               postgres    false    221    223    4768            7   i  x�u�KO�0���?Ɗ���2#E�l\�Ҙq�W��I�.lu>݇�.����*��)�/�]��L>��Q�2υ������QN�$��F�-ak���7WwS	R������X�y+}�'�2���p�We��e����h���J�'�ww4!,���[�WUJW5�ԓJm�
e�R��9*����f���:���^z"5EO�ƛ�!��x�@������k�4	մx58㎚X��@gi�~�b��E���WHm�8m��wzb-�hY�ъ ��=��ѮK�.����HE�c6&i�1;y�=���Ï�BY��L`�]Z�`o#�/.���@��r�V���,�E��S��3ƾ���W      9   2  x�]S]s�0|>�
� &���z3��I&Liɤ}��Q+K�,���+��0y�g$���vO9���� ٷ�ي�U� �����Px�;G���O@��`PEY��R��GY�k`�G4�p�@�w܈|�VF��@9��]0x��ͺ���5�չ�{9�����g�����z<�5�(`�[�o��0�d�#���ZZ�_�k:�e"O����T5�g\�ݶ���.K�JQ��6(�l�i�����e_��%\w{���@�(xl��
� r�ʊ��6�sC�L���"է�F6�c�m���{�[�ԅ#p��>��x2�_n�VuB#�Y���hu�`rvb/XK�2��s�r��d��D��'�)�����8f�Sk/k-5�Ì�^/��u�at��,u0���tꪢ>7�$���u�d:�2ˇH�H\��������;h/�{���%ӭ3�lY���947rSůk)��a��jGb
��U�iY�44?m�n,�u�
u7ay���n|�����q��;Z�!"��R�o�?�(9��k�x���ѝk[3�/�'���}�K��y'����M�      ;   �  x�]�Oo� ���w�w�[�4�m�H��B��5)�����/��~��F����xxD�Ar�)��-��+�7�R��"��� z!�~8��_Bt*����kT����l�4M��T
X����oa�5�=.�O:8�ϐ7����
*��-^˨�i����W��w��$�sN�������^��R*��O��Hx
�
�U�e4R!��ns�m)"�/��yf��ن��1G���	���mQ����y[r�^�3"<�4�cI�T����lh9���>8�d���T�u�����'*z�U�-ՙWi=�D=��:���&����������]��b*%��g��#�����ox\�����Np*9����S-����s�ᚣ�f���8��      =   V  x�m��N�0E�����{�"Q		�Hlؘ0��)�S���NR�PvV4�s�9��	��x��$��
�����2�+�2��Fc�o�9pH!'-�o�0�SZ�V��S1��'�����I��VY'�K�M��_���)�����Si���y
%����hm(��\J�XI�@�;E�J�H��C�B�V��Щ�#�9fNl���]�rFE� '�F����������%^9	���0))/�4�=(��;��UKv�E-%�P�
6��B�Q��,J��d�r�0	�	x��԰���d��o���U8^�/���j�.�X�oVw�:�<f+�f������<���<�     