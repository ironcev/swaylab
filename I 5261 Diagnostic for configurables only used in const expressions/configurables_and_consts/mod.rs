use fuels::prelude::*;

#[tokio::test]
async fn contract_uses_default_configurables() -> Result<()> {
    abigen!(Contract(
        name = "MyContract",
        abi =
            "configurables_and_consts/out/debug/configurables_and_consts-abi.json"
    ));

    let wallet = launch_provider_and_get_wallet().await?;

    const DEPLOYMENT_TIME_CONFIG_X: u64 = 112233;
    let configurables = MyContractConfigurables::new()
        .with_CONFIG_X(DEPLOYMENT_TIME_CONFIG_X);

    let contract_id = Contract::load_from(
        "configurables_and_consts/out/debug/configurables_and_consts.bin",
        LoadConfiguration::default().with_configurables(configurables),
    )
    .unwrap()
    .deploy(&wallet, TxParameters::default())
    .await?;

    let contract_instance = MyContract::new(contract_id, wallet.clone());

    let response = contract_instance
        .methods()
        .test_configurables_and_consts()
        .call()
        .await?;

    let expected_value = (42u64, DEPLOYMENT_TIME_CONFIG_X);

    assert_eq!(response.value, expected_value);

    Ok(())
}
