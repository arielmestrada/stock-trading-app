
     document.querySelectorAll('.qty-btn').forEach(e => {
      
        e.addEventListener('click', el => {
          const qty = document.getElementById('form1').value
          let price = document.getElementById('staticPrice').textContent
          price = price.replace( /^\D+/g, '')
          price = +price
          price = price * qty
          let money = Intl.NumberFormat('en-US', {
            style: "currency",
            currency: "USD",
            useGrouping: true,
          })
          document.getElementById('front-price').textContent = money.format(price)
          document.getElementById('quantity').value = qty

          if(parseInt(document.getElementById('form1').value) >= parseInt(document.getElementById('maxSellQty').textContent)) {

            document.getElementById('form1').value = parseInt(document.getElementById('maxSellQty').textContent)
            document.getElementById('quantity').value =     document.getElementById('form1').value 
        } 
      }) 
   })

  
   document.getElementById('form1').addEventListener('change', el => {
            const qty = document.getElementById('form1').value
            let price = document.getElementById('staticPrice').textContent
            price = price.replace( /^\D+/g, '')
            price = +price
            price = price * qty
            let money = Intl.NumberFormat('en-US', {
              style: "currency",
              currency: "USD",
              useGrouping: true,
            })
            document.getElementById('front-price').textContent = money.format(price)
            document.getElementById('quantity').value = qty
  
            if(parseInt(document.getElementById('form1').value) >= parseInt(document.getElementById('maxSellQty').textContent)) {

                document.getElementById('form1').value = parseInt(document.getElementById('maxSellQty').textContent)
                document.getElementById('quantity').value =     document.getElementById('form1').value 
            } 
   })

  
   

   document.getElementById('fakeCommit').addEventListener('click', e => {
    $('#sell').trigger('click')
   })


