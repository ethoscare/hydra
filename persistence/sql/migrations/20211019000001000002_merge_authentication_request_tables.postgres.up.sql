-- Migration generated by the command below; DO NOT EDIT.
-- hydra:generate hydra migrations gen

CREATE INDEX hydra_oauth2_flow_client_id_subject_idx ON public.hydra_oauth2_flow USING btree (client_id, subject);
CREATE INDEX hydra_oauth2_flow_cid_idx ON public.hydra_oauth2_flow USING btree (client_id);
CREATE INDEX hydra_oauth2_flow_login_session_id_idx ON public.hydra_oauth2_flow USING btree (login_session_id);
CREATE INDEX hydra_oauth2_flow_sub_idx ON public.hydra_oauth2_flow USING btree (subject);
CREATE UNIQUE INDEX hydra_oauth2_flow_consent_challenge_idx ON public.hydra_oauth2_flow USING btree (consent_challenge_id);
CREATE UNIQUE INDEX hydra_oauth2_flow_login_verifier_idx ON public.hydra_oauth2_flow USING btree (login_verifier);
CREATE INDEX hydra_oauth2_flow_consent_verifier_idx ON public.hydra_oauth2_flow USING btree (consent_verifier);

ALTER TABLE ONLY public.hydra_oauth2_flow ADD CONSTRAINT hydra_oauth2_flow_pkey PRIMARY KEY (login_challenge);
ALTER TABLE ONLY public.hydra_oauth2_flow ADD CONSTRAINT hydra_oauth2_flow_client_id_fk FOREIGN KEY (client_id) REFERENCES public.hydra_client(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.hydra_oauth2_flow ADD CONSTRAINT hydra_oauth2_flow_login_session_id_fk FOREIGN KEY (login_session_id) REFERENCES public.hydra_oauth2_authentication_session(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.hydra_oauth2_access DROP CONSTRAINT hydra_oauth2_access_challenge_id_fk;
ALTER TABLE ONLY public.hydra_oauth2_access ADD CONSTRAINT hydra_oauth2_access_challenge_id_fk FOREIGN KEY (challenge_id) REFERENCES public.hydra_oauth2_flow(consent_challenge_id) ON DELETE CASCADE;

ALTER TABLE ONLY public.hydra_oauth2_code DROP CONSTRAINT hydra_oauth2_code_challenge_id_fk;
ALTER TABLE ONLY public.hydra_oauth2_code ADD CONSTRAINT hydra_oauth2_code_challenge_id_fk FOREIGN KEY (challenge_id) REFERENCES public.hydra_oauth2_flow(consent_challenge_id) ON DELETE CASCADE;

ALTER TABLE ONLY public.hydra_oauth2_oidc DROP CONSTRAINT hydra_oauth2_oidc_challenge_id_fk;
ALTER TABLE ONLY public.hydra_oauth2_oidc ADD CONSTRAINT hydra_oauth2_oidc_challenge_id_fk FOREIGN KEY (challenge_id) REFERENCES public.hydra_oauth2_flow(consent_challenge_id) ON DELETE CASCADE;

ALTER TABLE ONLY public.hydra_oauth2_pkce DROP CONSTRAINT hydra_oauth2_pkce_challenge_id_fk;
ALTER TABLE ONLY public.hydra_oauth2_pkce ADD CONSTRAINT hydra_oauth2_pkce_challenge_id_fk FOREIGN KEY (challenge_id) REFERENCES public.hydra_oauth2_flow(consent_challenge_id) ON DELETE CASCADE;

ALTER TABLE ONLY public.hydra_oauth2_refresh DROP CONSTRAINT hydra_oauth2_refresh_challenge_id_fk;
ALTER TABLE ONLY public.hydra_oauth2_refresh ADD CONSTRAINT hydra_oauth2_refresh_challenge_id_fk FOREIGN KEY (challenge_id) REFERENCES public.hydra_oauth2_flow(consent_challenge_id) ON DELETE CASCADE;

