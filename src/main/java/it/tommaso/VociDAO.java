package it.tommaso;


import it.tommaso.beans.Voci;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public class VociDAO {
   //fa solo update
    public static void salva(Voci c) {
        EntityManager em
                = PM.getEM();
        EntityTransaction et
                = em.getTransaction();
        try {
            et.begin();
            em.merge(c);
            et.commit();
        } finally {
            if (et.isActive()) {
                et.rollback();
            }
            em.close();
        }
    }

    public static List<Voci> elenco() {
        EntityManager em = PM.getEM();
        try {
            Query q = em.createNamedQuery("Voci.findAll");
            List res = q.getResultList();
            return res;
        } finally {
            em.close();
        }
    }

    public static void elimina(Voci c) {
        EntityManager em = PM.getEM();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            c = em.find(Voci.class, c.getId());
            em.remove(c);
            et.commit();
        } finally {
            if (et.isActive()) {
                et.rollback();
            }
            em.close();
        }
    }
}
