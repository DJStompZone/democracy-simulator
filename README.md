# Democracy Simulator

## Running the Simulator

```ps1
./democracy.ps1
```

## Verifying the Script Signature

1. Import the public code signing certificate:
   
   ```ps1
   Import-Certificate -FilePath .\DJStomp-CodeSign.cer -CertStoreLocation Cert:\LocalMachine\Root | Out-Null
   Import-Certificate -FilePath .\DJStomp-CodeSign.cer -CertStoreLocation Cert:\LocalMachine\TrustedPublisher | Out-Null
   ```

2. Verify the signature:

   ```ps1
   Get-AuthenticodeSignature .\democracy.ps1
   ```
