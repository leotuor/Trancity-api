CREATE TABLE public.pontos_de_parada (
    idponto_parada integer NOT NULL,
    previsao_chegada timestamp without time zone,
    horario_chegada timestamp without time zone,
    horario_saida timestamp without time zone,
    idveiculo character varying(10),
    endereco_id integer
);


ALTER TABLE public.pontos_de_parada OWNER TO postgres;

--
-- Name: pontos_de_parada_idponto_parada_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pontos_de_parada_idponto_parada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pontos_de_parada_idponto_parada_seq OWNER TO postgres;

--
-- Name: pontos_de_parada_idponto_parada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pontos_de_parada_idponto_parada_seq OWNED BY public.pontos_de_parada.idponto_parada;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(120),
    telefone character varying(11),
    password_hash text NOT NULL,
    username character varying NOT NULL,
    cargo character varying(25)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_idusuario_seq OWNER TO postgres;

--
-- Name: usuarios_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_idusuario_seq OWNED BY public.usuarios.id;


--
-- Name: veiculos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculos (
    placa_veiculo character varying(10) NOT NULL,
    capacidade integer,
    disponibilidade boolean,
    idmotorista integer
);


ALTER TABLE public.veiculos OWNER TO postgres;

--
-- Name: pontos_de_parada idponto_parada; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pontos_de_parada ALTER COLUMN idponto_parada SET DEFAULT nextval('public.pontos_de_parada_idponto_parada_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_idusuario_seq'::regclass);


--
-- Data for Name: pontos_de_parada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id, nome, telefone, password_hash, username, cargo) VALUES (3, 'Leo', '4999999', '$2b$10$JG9PBf8ScZT4Lmw9AhXxOe7w4aDP2tYuAJkskL.9wAOHlas19N3.S', 'adm', 'admin');


ALTER TABLE ONLY public.pontos_de_parada
    ADD CONSTRAINT pontos_de_parada_pkey PRIMARY KEY (idponto_parada);


--
-- Name: usuarios usuarios_cargo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cargo_key UNIQUE (cargo);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_username_key UNIQUE (username);


--
-- Name: veiculos veiculos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT veiculos_pkey PRIMARY KEY (placa_veiculo);


--
-- Name: veiculos fk_motorista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT fk_motorista FOREIGN KEY (idmotorista) REFERENCES public.usuarios(id);


--
-- Name: pontos_de_parada fk_veiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pontos_de_parada
    ADD CONSTRAINT fk_veiculo FOREIGN KEY (idveiculo) REFERENCES public.veiculos(placa_veiculo);


--
-- PostgreSQL database dump complete
--

