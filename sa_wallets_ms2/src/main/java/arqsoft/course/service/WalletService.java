package arqsoft.wallet.service;

import arqsoft.wallet.model.Wallet;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Stateless
public class WalletService {

    @PersistenceContext
    EntityManager entityManager;

    public List<Wallet> getAllWallets(int first, int maxResult) {
        return entityManager.createNamedQuery(Wallet.FIND_ALL)
                .setFirstResult(first).setMaxResults(maxResult).getResultList();
    }

    public Wallet getWalletById(long id){
        return entityManager.find(Wallet.class, id);
    }

    public void createWallet(Wallet wallet) {
        entityManager.persist(wallet);
    }

    public Wallet updateWallet(long id, Wallet wallet) {
        Wallet walletToUpdate = entityManager.find(Wallet.class, id);
        walletToUpdate.setBalance2(wallet.getBalance());
        return entityManager.merge(walletToUpdate);
    }

    public void deleteWallet(long id) {
        Wallet wallet = entityManager.find(Wallet.class, id);
        entityManager.remove(wallet);
    }
}
