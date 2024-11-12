CREATE TABLE public.app_roles (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    role_name text NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    PRIMARY KEY (id)
);

INSERT INTO public.app_roles(id, role_name)
VALUES (gen_random_uuid(), 'manager');

CREATE TYPE gender AS ENUM ('male', 'female', 'other');

CREATE TABLE public.profiles (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    id_user uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    id_role uuid NOT NULL REFERENCES public.app_roles(id),
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    birthdate date NOT NULL, 
    phone text NOT NULL,
    gender gender NOT NULL,
    img_url text,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    deleted_at timestamp with time zone,
    PRIMARY KEY (id)
);

CREATE FUNCTION public.handle_signup() 
RETURNS trigger 
LANGUAGE plpgsql 
SECURITY DEFINER
SET search_path = public 
AS $$ 
BEGIN
    INSERT INTO public.profiles (
        id,
        id_user,
        id_role,
        first_name,
        last_name, 
        email, 
        img_url,
        phone,
        birthdate,
        gender
    )
    VALUES (
        gen_random_uuid(),
        NEW.id,
        (SELECT id FROM public.app_roles WHERE role_name = 'manager'),
        NEW.raw_user_meta_data ->> 'first_name',
        NEW.raw_user_meta_data ->> 'last_name',
        NEW.raw_user_meta_data ->> 'email',
        NEW.raw_user_meta_data ->> 'phone',
        NEW.raw_user_meta_data ->> 'img_url',
        (NEW.raw_user_meta_data ->> 'birthdate')::date,
        (NEW.raw_user_meta_data ->> 'gender')::gender
    );
    RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_signup();

-- Add public.addresses
CREATE TABLE public.addresses (
  id uuid NOT NULL DEFAULT gen_random_uuid(), 
  id_profile uuid NOT NULL REFERENCES public.profiles(id),
  street text NOT NULL,
  number text NOT NULL, 
  complement text, 
  neighborhood text NOT NULL, 
  city text NOT NULL, 
  state text NOT NULL, 
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  PRIMARY KEY(id)
);

-- @Rowback
-- DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
-- DROP FUNCTION IF EXISTS public.handle_signup;
-- DROP TYPE IF EXISTS gender; 
-- DROP TABLE IF EXISTS public.addresses; 
-- DROP TABLE IF EXISTS public.profiles; 
-- DROP TABLE IF EXISTS public.app_roles; 
