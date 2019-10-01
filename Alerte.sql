DECLARE

  V_NB NUMBER(10);

begin
     SELECT count(*) into V_NB from t_ep_inst@ines2_dbl  where start_time >= sysdate -1/48;
     if (V_NB =0)then 
       ---
      tec_p_mail(p_dest_mail  => 'saad.bouna@engie.com;mostafa.sayad@cgi.com;hasnaa.faiq@engie.com;exploitation-eai.genesis.cofely@engie.com',
                     p_cc_mail    => 'saad.bouna@engie.com;gregory.grzeczka@engie.com',
                     p_objet_mail => 'Alerte - Problème EAI',
                     p_corps_mail => 'Attention, aucun flux consommé par l''EAI durant les 30 dernières minutes',
                     p_signature  => 'Cellule Conduite Applicative',
                     p_exp_mail   => 'do_not_reply@engie.com');
     end if;
     
END;
