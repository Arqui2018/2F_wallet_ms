<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Wallet;

class WalletController extends Controller
{
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $wallet = Wallet::find($id);

        if(!$wallet)
        {
          return response()->json(['errors'=> array(['code'=>404,'message'=>"Wallet wasn't find." ])],404);
        }
        return response()->json(['status'=>'ok','data'=>$wallet],200);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $wallet = Wallet::find($id);
        if (!$wallet)
    		{
          echo $request->balance;
          return response()->json(['errors'=> array(['code'=>404,'message'=>"Wallet wasn't find." ])],404);
    		}

        $wallet->balance = $wallet->balance + $request->balance;
        $wallet->save();
        return response()->json(['status'=>'ok','data'=>$wallet], 200);

    }
}
