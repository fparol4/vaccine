


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";





SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."agendamento" (
    "agendamento_id (PK)" bigint NOT NULL,
    "titular (FK)" "uuid" DEFAULT "gen_random_uuid"(),
    "forma_pagamento_id (FK)" bigint,
    "unidade_id (FK)" bigint,
    "data" "date",
    "unidade_faixa_horarios_id (FK)" bigint,
    "valor_total" double precision,
    "observacao" "text",
    "ref_status_agendamento_id (FK)" bigint
);


ALTER TABLE "public"."agendamento" OWNER TO "postgres";


ALTER TABLE "public"."agendamento" ALTER COLUMN "agendamento_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."agendamento_agendamento_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."agendamento_paciente" (
    "agendamento_paciente_id (PK)" bigint NOT NULL,
    "agendamento_id (FK)" bigint,
    "paciente_id (FK)" bigint
);


ALTER TABLE "public"."agendamento_paciente" OWNER TO "postgres";


ALTER TABLE "public"."agendamento_paciente" ALTER COLUMN "agendamento_paciente_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."agendamento_paciente_agendamento_paciente_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."agendamento_paciente_vacina" (
    "agendamento_paciente_vacina_id (PK)" bigint NOT NULL,
    "vacina_id (FK)" bigint,
    "agendamento_paciente_id (FK)" bigint
);


ALTER TABLE "public"."agendamento_paciente_vacina" OWNER TO "postgres";


ALTER TABLE "public"."agendamento_paciente_vacina" ALTER COLUMN "agendamento_paciente_vacina_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."agendamento_paciente_vacina_agendamento_paciente_vacina_id _seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."paciente" (
    "paciente_id (PK)" bigint NOT NULL,
    "titular (FK)" "uuid" DEFAULT "gen_random_uuid"(),
    "titular_parentesco" "text",
    "nome_completo" "text",
    "nome_mae" "text",
    "cpf" "text",
    "data_nascimento" "date",
    "sexo" "text",
    "celular" "text",
    "email" "text"
);


ALTER TABLE "public"."paciente" OWNER TO "postgres";


ALTER TABLE "public"."paciente" ALTER COLUMN "paciente_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."paciente_paciente_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."ref_dias_semana" (
    "ref_dias_semana_id (PK)" bigint NOT NULL,
    "dia_nome" "text",
    "dia_nome_abrev" "text",
    "dia_numero" smallint
);


ALTER TABLE "public"."ref_dias_semana" OWNER TO "postgres";


ALTER TABLE "public"."ref_dias_semana" ALTER COLUMN "ref_dias_semana_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."ref_dias_semana_ref_dias_semana_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."ref_formas_pagamento" (
    "ref_formas_pagamento_id (PK)" bigint NOT NULL,
    "nome" "text"
);


ALTER TABLE "public"."ref_formas_pagamento" OWNER TO "postgres";


ALTER TABLE "public"."ref_formas_pagamento" ALTER COLUMN "ref_formas_pagamento_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."ref_formas_pagamento_ref_formas_pagamento_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."ref_planos" (
    "ref_vacinas_id (PK)" bigint NOT NULL,
    "nome" "text" NOT NULL,
    "valor" numeric,
    "vacinas" bigint[],
    "Status" boolean DEFAULT true
);


ALTER TABLE "public"."ref_planos" OWNER TO "postgres";


ALTER TABLE "public"."ref_planos" ALTER COLUMN "ref_vacinas_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."ref_planos_ref_vacinas_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."ref_planos_saude" (
    "ref_planos_saude_id (PK)" bigint NOT NULL,
    "nome" "text"
);


ALTER TABLE "public"."ref_planos_saude" OWNER TO "postgres";


ALTER TABLE "public"."ref_planos_saude" ALTER COLUMN "ref_planos_saude_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."ref_planos_saude_ref_planos_saude_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."ref_status_agendamento" (
    "ref_status_agendamento_id (PK)" bigint NOT NULL,
    "nome" "text"
);


ALTER TABLE "public"."ref_status_agendamento" OWNER TO "postgres";


ALTER TABLE "public"."ref_status_agendamento" ALTER COLUMN "ref_status_agendamento_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."ref_status_agendamento_ref_status_agendamento_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."ref_user_role" (
    "ref_user_role_id (PK)" bigint NOT NULL,
    "nome" "text"
);


ALTER TABLE "public"."ref_user_role" OWNER TO "postgres";


ALTER TABLE "public"."ref_user_role" ALTER COLUMN "ref_user_role_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."ref_user_role_ref_user_role_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."ref_vacinas" (
    "ref_vacinas_id (PK)" bigint NOT NULL,
    "nome" "text",
    "código" "text",
    "preço" double precision,
    "Status" boolean DEFAULT true,
    "valor_plano" numeric,
    "valor_protecao" numeric
);


ALTER TABLE "public"."ref_vacinas" OWNER TO "postgres";


ALTER TABLE "public"."ref_vacinas" ALTER COLUMN "ref_vacinas_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."ref_vacinas_ref_vacinas_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."unidade" (
    "id" bigint NOT NULL,
    "nome" "text",
    "nome_interno" "text",
    "email" "text",
    "telefone" "text",
    "cep" "text",
    "logradouro" "text",
    "numero" "text",
    "complemento" "text",
    "bairro" "text",
    "cidade" "text",
    "estado" "text",
    "status" boolean,
    "atende_aplicativo" boolean,
    "mostra_preços_unidades" boolean,
    "limite_faixa_horário" numeric,
    "limite_agendamento" numeric
);


ALTER TABLE "public"."unidade" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."unidade_ceps_naoatende" (
    "id" bigint NOT NULL,
    "cep_inicial" "text",
    "cep_final" "text",
    "unidade_id (FK)" bigint
);


ALTER TABLE "public"."unidade_ceps_naoatende" OWNER TO "postgres";


COMMENT ON TABLE "public"."unidade_ceps_naoatende" IS 'This is a duplicate of unidade_faixa_ceps';



ALTER TABLE "public"."unidade_ceps_naoatende" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."unidade_ceps_naoatende_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."unidade_faixa_ceps" (
    "id" bigint NOT NULL,
    "cep_inicial" "text",
    "cep_final" "text",
    "unidade_id" bigint
);


ALTER TABLE "public"."unidade_faixa_ceps" OWNER TO "postgres";


ALTER TABLE "public"."unidade_faixa_ceps" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."unidade_faixa_ceps_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."unidade_faixa_horarios" (
    "unidade_faixa_horarios_id (PK)" bigint NOT NULL,
    "hora_inicial" time without time zone,
    "hora_final" time without time zone,
    "ref_dias_semana_id (FK)" bigint,
    "unidade_id (FK)" bigint
);


ALTER TABLE "public"."unidade_faixa_horarios" OWNER TO "postgres";


ALTER TABLE "public"."unidade_faixa_horarios" ALTER COLUMN "unidade_faixa_horarios_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."unidade_faixa_horarios_unidade_faixa_horarios_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."unidade_faixa_naoatende_ceps" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "cep" "text",
    "logradouro" "text",
    "bairro" "text",
    "unidade_id" bigint
);


ALTER TABLE "public"."unidade_faixa_naoatende_ceps" OWNER TO "postgres";


ALTER TABLE "public"."unidade_faixa_naoatende_ceps" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."unidade_faixa_naoatende_ceps_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE "public"."unidade" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."unidade_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."unidade_planos_saude" (
    "unidade_planos_saude_id (PK)" bigint NOT NULL,
    "ref_planos_saude_id (FK)" bigint,
    "unidade_id (FK)" bigint
);


ALTER TABLE "public"."unidade_planos_saude" OWNER TO "postgres";


ALTER TABLE "public"."unidade_planos_saude" ALTER COLUMN "unidade_planos_saude_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."unidade_planos_saude_unidade_planos_saude_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."unidade_vacinas" (
    "unidade_vacinas_id (PK)" bigint NOT NULL,
    "ref_vacinas_id (FK)" bigint,
    "unidade_id (FK)" bigint
);


ALTER TABLE "public"."unidade_vacinas" OWNER TO "postgres";


ALTER TABLE "public"."unidade_vacinas" ALTER COLUMN "unidade_vacinas_id (PK)" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."unidade_vacinas_unidade_vacinas_id (PK)_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."user" (
    "id" bigint NOT NULL,
    "nome" "text",
    "sobrenome" "text",
    "email" "text",
    "nascimento" "date",
    "sexo" "text",
    "celular" "text",
    "imagem_perfil" "text",
    "ref_user_role_id (FK)" bigint,
    "logradouro" "text",
    "numero" "text",
    "complemento" "text",
    "bairro" "text",
    "cidade" "text",
    "estado" "text",
    "user_id  (PK)" "uuid" DEFAULT "gen_random_uuid"(),
    "área" "text",
    "units" "text"[],
    "status" boolean
);


ALTER TABLE "public"."user" OWNER TO "postgres";


ALTER TABLE "public"."user" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY "public"."agendamento_paciente"
    ADD CONSTRAINT "agendamento_paciente_pkey" PRIMARY KEY ("agendamento_paciente_id (PK)");



ALTER TABLE ONLY "public"."agendamento_paciente_vacina"
    ADD CONSTRAINT "agendamento_paciente_vacina_pkey" PRIMARY KEY ("agendamento_paciente_vacina_id (PK)");



ALTER TABLE ONLY "public"."agendamento"
    ADD CONSTRAINT "agendamento_pkey" PRIMARY KEY ("agendamento_id (PK)");



ALTER TABLE ONLY "public"."paciente"
    ADD CONSTRAINT "paciente_pkey" PRIMARY KEY ("paciente_id (PK)");



ALTER TABLE ONLY "public"."ref_dias_semana"
    ADD CONSTRAINT "ref_dias_semana_pkey" PRIMARY KEY ("ref_dias_semana_id (PK)");



ALTER TABLE ONLY "public"."ref_formas_pagamento"
    ADD CONSTRAINT "ref_formas_pagamento_pkey" PRIMARY KEY ("ref_formas_pagamento_id (PK)");



ALTER TABLE ONLY "public"."ref_planos"
    ADD CONSTRAINT "ref_planos_pkey" PRIMARY KEY ("ref_vacinas_id (PK)");



ALTER TABLE ONLY "public"."ref_planos_saude"
    ADD CONSTRAINT "ref_planos_saude_pkey" PRIMARY KEY ("ref_planos_saude_id (PK)");



ALTER TABLE ONLY "public"."ref_status_agendamento"
    ADD CONSTRAINT "ref_status_agendamento_pkey" PRIMARY KEY ("ref_status_agendamento_id (PK)");



ALTER TABLE ONLY "public"."ref_user_role"
    ADD CONSTRAINT "ref_user_role_pkey" PRIMARY KEY ("ref_user_role_id (PK)");



ALTER TABLE ONLY "public"."ref_vacinas"
    ADD CONSTRAINT "ref_vacinas_pkey" PRIMARY KEY ("ref_vacinas_id (PK)");



ALTER TABLE ONLY "public"."unidade_ceps_naoatende"
    ADD CONSTRAINT "unidade_ceps_naoatende_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."unidade_faixa_ceps"
    ADD CONSTRAINT "unidade_faixa_ceps_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."unidade_faixa_horarios"
    ADD CONSTRAINT "unidade_faixa_horarios_pkey" PRIMARY KEY ("unidade_faixa_horarios_id (PK)");



ALTER TABLE ONLY "public"."unidade_faixa_naoatende_ceps"
    ADD CONSTRAINT "unidade_faixa_naoatende_ceps_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."unidade"
    ADD CONSTRAINT "unidade_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."unidade_planos_saude"
    ADD CONSTRAINT "unidade_planos_saude_pkey" PRIMARY KEY ("unidade_planos_saude_id (PK)");



ALTER TABLE ONLY "public"."unidade_vacinas"
    ADD CONSTRAINT "unidade_vacinas_pkey" PRIMARY KEY ("unidade_vacinas_id (PK)");



ALTER TABLE ONLY "public"."unidade_faixa_ceps"
    ADD CONSTRAINT "unidade_faixa_ceps_unidade_id (FK)_fkey" FOREIGN KEY ("unidade_id") REFERENCES "public"."unidade"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."unidade_faixa_horarios"
    ADD CONSTRAINT "unidade_faixa_horarios_unidade_id (FK)_fkey" FOREIGN KEY ("unidade_id (FK)") REFERENCES "public"."unidade"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."unidade_faixa_naoatende_ceps"
    ADD CONSTRAINT "unidade_faixa_naoatende_ceps_unidade_id_fkey" FOREIGN KEY ("unidade_id") REFERENCES "public"."unidade"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."unidade_planos_saude"
    ADD CONSTRAINT "unidade_planos_saude_unidade_id (FK)_fkey" FOREIGN KEY ("unidade_id (FK)") REFERENCES "public"."unidade"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."unidade_vacinas"
    ADD CONSTRAINT "unidade_vacinas_ref_vacinas_id (FK)_fkey" FOREIGN KEY ("ref_vacinas_id (FK)") REFERENCES "public"."ref_vacinas"("ref_vacinas_id (PK)") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."unidade_vacinas"
    ADD CONSTRAINT "unidade_vacinas_unidade_id (FK)_fkey" FOREIGN KEY ("unidade_id (FK)") REFERENCES "public"."unidade"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "user_ref_user_role_id (FK)_fkey" FOREIGN KEY ("ref_user_role_id (FK)") REFERENCES "public"."ref_user_role"("ref_user_role_id (PK)");



CREATE POLICY "TESTE" ON "public"."ref_vacinas" USING (true);



CREATE POLICY "Teste" ON "public"."ref_planos" USING (true);



ALTER TABLE "public"."agendamento" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."agendamento_paciente" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."agendamento_paciente_vacina" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."paciente" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ref_dias_semana" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ref_formas_pagamento" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ref_planos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ref_planos_saude" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ref_status_agendamento" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ref_user_role" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ref_vacinas" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "teste" ON "public"."unidade" USING (true);



CREATE POLICY "teste" ON "public"."unidade_faixa_ceps" USING (true);



CREATE POLICY "teste" ON "public"."unidade_faixa_horarios" TO "authenticated" USING (true);



CREATE POLICY "teste" ON "public"."unidade_planos_saude" TO "authenticated" USING (true);



CREATE POLICY "teste" ON "public"."unidade_vacinas" TO "authenticated" USING (true);



CREATE POLICY "tryes" ON "public"."unidade_faixa_naoatende_ceps" USING (true);



ALTER TABLE "public"."unidade" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."unidade_faixa_ceps" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."unidade_faixa_horarios" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."unidade_faixa_naoatende_ceps" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."unidade_planos_saude" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."unidade_vacinas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



































































































































































































GRANT ALL ON TABLE "public"."agendamento" TO "anon";
GRANT ALL ON TABLE "public"."agendamento" TO "authenticated";
GRANT ALL ON TABLE "public"."agendamento" TO "service_role";



GRANT ALL ON SEQUENCE "public"."agendamento_agendamento_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."agendamento_agendamento_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."agendamento_agendamento_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."agendamento_paciente" TO "anon";
GRANT ALL ON TABLE "public"."agendamento_paciente" TO "authenticated";
GRANT ALL ON TABLE "public"."agendamento_paciente" TO "service_role";



GRANT ALL ON SEQUENCE "public"."agendamento_paciente_agendamento_paciente_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."agendamento_paciente_agendamento_paciente_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."agendamento_paciente_agendamento_paciente_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."agendamento_paciente_vacina" TO "anon";
GRANT ALL ON TABLE "public"."agendamento_paciente_vacina" TO "authenticated";
GRANT ALL ON TABLE "public"."agendamento_paciente_vacina" TO "service_role";



GRANT ALL ON SEQUENCE "public"."agendamento_paciente_vacina_agendamento_paciente_vacina_id _seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."agendamento_paciente_vacina_agendamento_paciente_vacina_id _seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."agendamento_paciente_vacina_agendamento_paciente_vacina_id _seq" TO "service_role";



GRANT ALL ON TABLE "public"."paciente" TO "anon";
GRANT ALL ON TABLE "public"."paciente" TO "authenticated";
GRANT ALL ON TABLE "public"."paciente" TO "service_role";



GRANT ALL ON SEQUENCE "public"."paciente_paciente_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."paciente_paciente_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."paciente_paciente_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ref_dias_semana" TO "anon";
GRANT ALL ON TABLE "public"."ref_dias_semana" TO "authenticated";
GRANT ALL ON TABLE "public"."ref_dias_semana" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ref_dias_semana_ref_dias_semana_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ref_dias_semana_ref_dias_semana_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ref_dias_semana_ref_dias_semana_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ref_formas_pagamento" TO "anon";
GRANT ALL ON TABLE "public"."ref_formas_pagamento" TO "authenticated";
GRANT ALL ON TABLE "public"."ref_formas_pagamento" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ref_formas_pagamento_ref_formas_pagamento_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ref_formas_pagamento_ref_formas_pagamento_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ref_formas_pagamento_ref_formas_pagamento_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ref_planos" TO "anon";
GRANT ALL ON TABLE "public"."ref_planos" TO "authenticated";
GRANT ALL ON TABLE "public"."ref_planos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ref_planos_ref_vacinas_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ref_planos_ref_vacinas_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ref_planos_ref_vacinas_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ref_planos_saude" TO "anon";
GRANT ALL ON TABLE "public"."ref_planos_saude" TO "authenticated";
GRANT ALL ON TABLE "public"."ref_planos_saude" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ref_planos_saude_ref_planos_saude_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ref_planos_saude_ref_planos_saude_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ref_planos_saude_ref_planos_saude_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ref_status_agendamento" TO "anon";
GRANT ALL ON TABLE "public"."ref_status_agendamento" TO "authenticated";
GRANT ALL ON TABLE "public"."ref_status_agendamento" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ref_status_agendamento_ref_status_agendamento_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ref_status_agendamento_ref_status_agendamento_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ref_status_agendamento_ref_status_agendamento_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ref_user_role" TO "anon";
GRANT ALL ON TABLE "public"."ref_user_role" TO "authenticated";
GRANT ALL ON TABLE "public"."ref_user_role" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ref_user_role_ref_user_role_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ref_user_role_ref_user_role_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ref_user_role_ref_user_role_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ref_vacinas" TO "anon";
GRANT ALL ON TABLE "public"."ref_vacinas" TO "authenticated";
GRANT ALL ON TABLE "public"."ref_vacinas" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ref_vacinas_ref_vacinas_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ref_vacinas_ref_vacinas_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ref_vacinas_ref_vacinas_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."unidade" TO "anon";
GRANT ALL ON TABLE "public"."unidade" TO "authenticated";
GRANT ALL ON TABLE "public"."unidade" TO "service_role";



GRANT ALL ON TABLE "public"."unidade_ceps_naoatende" TO "anon";
GRANT ALL ON TABLE "public"."unidade_ceps_naoatende" TO "authenticated";
GRANT ALL ON TABLE "public"."unidade_ceps_naoatende" TO "service_role";



GRANT ALL ON SEQUENCE "public"."unidade_ceps_naoatende_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."unidade_ceps_naoatende_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."unidade_ceps_naoatende_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."unidade_faixa_ceps" TO "anon";
GRANT ALL ON TABLE "public"."unidade_faixa_ceps" TO "authenticated";
GRANT ALL ON TABLE "public"."unidade_faixa_ceps" TO "service_role";



GRANT ALL ON SEQUENCE "public"."unidade_faixa_ceps_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."unidade_faixa_ceps_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."unidade_faixa_ceps_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."unidade_faixa_horarios" TO "anon";
GRANT ALL ON TABLE "public"."unidade_faixa_horarios" TO "authenticated";
GRANT ALL ON TABLE "public"."unidade_faixa_horarios" TO "service_role";



GRANT ALL ON SEQUENCE "public"."unidade_faixa_horarios_unidade_faixa_horarios_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."unidade_faixa_horarios_unidade_faixa_horarios_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."unidade_faixa_horarios_unidade_faixa_horarios_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."unidade_faixa_naoatende_ceps" TO "anon";
GRANT ALL ON TABLE "public"."unidade_faixa_naoatende_ceps" TO "authenticated";
GRANT ALL ON TABLE "public"."unidade_faixa_naoatende_ceps" TO "service_role";



GRANT ALL ON SEQUENCE "public"."unidade_faixa_naoatende_ceps_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."unidade_faixa_naoatende_ceps_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."unidade_faixa_naoatende_ceps_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."unidade_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."unidade_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."unidade_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."unidade_planos_saude" TO "anon";
GRANT ALL ON TABLE "public"."unidade_planos_saude" TO "authenticated";
GRANT ALL ON TABLE "public"."unidade_planos_saude" TO "service_role";



GRANT ALL ON SEQUENCE "public"."unidade_planos_saude_unidade_planos_saude_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."unidade_planos_saude_unidade_planos_saude_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."unidade_planos_saude_unidade_planos_saude_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."unidade_vacinas" TO "anon";
GRANT ALL ON TABLE "public"."unidade_vacinas" TO "authenticated";
GRANT ALL ON TABLE "public"."unidade_vacinas" TO "service_role";



GRANT ALL ON SEQUENCE "public"."unidade_vacinas_unidade_vacinas_id (PK)_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."unidade_vacinas_unidade_vacinas_id (PK)_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."unidade_vacinas_unidade_vacinas_id (PK)_seq" TO "service_role";



GRANT ALL ON TABLE "public"."user" TO "anon";
GRANT ALL ON TABLE "public"."user" TO "authenticated";
GRANT ALL ON TABLE "public"."user" TO "service_role";



GRANT ALL ON SEQUENCE "public"."user_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."user_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."user_id_seq" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";






























RESET ALL;
