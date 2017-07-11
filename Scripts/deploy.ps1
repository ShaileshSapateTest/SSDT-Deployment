#--TeamCity checkout directory command line argument--
		param([string]$tcDir = "")
                #--Load the Dac.dll into the PowerShell session--
		Add-Type -Path "C:\Program Files (x86)\Microsoft SQL Server\130\DAC\bin\Microsoft.SqlServer.Dac.dll"
                #--Load the SQL Server instance--
		$dacService = new-object Microsoft.SqlServer.Dac.DacServices "server=(local)"
                #--Load the DACPAC--
		$dacPac = [Microsoft.SqlServer.Dac.DacPackage]::Load("$tcDir\DeployDBDemo\bin\Release\DeployDBDemo.dacpac")
                #--Deploy your database--
		$dacService.deploy($dacPac, "QA", "True") 