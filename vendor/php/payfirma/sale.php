$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://ecom.payfirma.com/sale');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, true);

$data = array(
	'merchant_id'=>'YOUR_MERCHANTID',
	'key'=>'YOUR_PAYFIRMA_API_KEY',
	'amount'=>'20.00',
	'token'=>$_REQUEST['token'],
	'first_name'=>$_REQUEST['first_name'],
	'last_name'=>$_REQUEST['last_name']
	);

curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
$output = curl_exec($ch);
curl_close($ch);

echo $output;
