package arqsoft.wallet.resource;

import arqsoft.wallet.model.Wallet;
import arqsoft.wallet.service.WalletService;

import javax.ejb.EJB;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import java.net.URI;
import java.util.List;

@Path("/wallet")
public class WalletResource {

    @Context
    UriInfo uriInfo;

    @EJB
    WalletService walletService;

    @GET
    public List<Wallet> getAllWallets(@QueryParam("first") int first, @QueryParam("maxResult") int maxResult) {
        return walletService.getAllWallets(first, maxResult);
    }

    @GET
    @Path("{id}")
    public Wallet getWalletById(@PathParam("id") long id) {
        return walletService.getWalletById(id);
    }

    @POST
    public Response createWallet(Wallet wallet) {
        walletService.createWallet(wallet);
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("{id}")
    public Response updateWallet(@PathParam("id") long id, Wallet wallet) {
        walletService.updateWallet(id, wallet);
        return Response.status(Response.Status.NO_CONTENT).build();
    }

    @DELETE
    @Path("{id}")
    public Response deleteWallet(@PathParam("id") long id) {
        walletService.deleteWallet(id);
        return Response.status(Response.Status.OK).build();
    }

}
