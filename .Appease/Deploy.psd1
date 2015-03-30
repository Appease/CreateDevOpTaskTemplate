[Hashtable]@{
	Tasks = [Ordered]@{
		PushAppeaseTemplate = [Hashtable]@{
			Name = [String]"PushAppeasePackage"; 
			TemplateId = [String]"PushAppeasePackage"; 
			TemplateVersion = [String]"0.0.23"; 
			Parameters = [Hashtable]@{
				IncludeNupkgFilePath = [String[]]@(
					[String]".\*"
				)
			}
		}
	}
}
