// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Ejercicio1"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform sampler2D _TextureSample1;
		uniform float4 _TextureSample1_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color48 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float4 Tri132 = tex2D( _TextureSample0, uv_TextureSample0 );
			float2 uv_TextureSample1 = i.uv_texcoord * _TextureSample1_ST.xy + _TextureSample1_ST.zw;
			float4 Tri233 = tex2D( _TextureSample1, uv_TextureSample1 );
			float4 color49 = IsGammaSpace() ? float4(0,0,1,0) : float4(0,0,1,0);
			o.Albedo = saturate( ( ( ( color48 * Tri132 ) + ( Tri233 * color49 ) ) - ( Tri132 * Tri233 ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
0;504;1592;482;3010.815;-597.9757;2.861158;True;True
Node;AmplifyShaderEditor.SamplerNode;2;-2138.752,161.1815;Inherit;True;Property;_TextureSample1;Texture Sample 1;1;0;Create;True;0;0;0;False;0;False;-1;None;6e34fe6b1c704584893bc62b3c8a96b8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-2078.021,-91.41562;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;978882e89c0abc64a81350eca290a89a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;32;-1700.85,-189.2388;Inherit;False;Tri1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;33;-1750.074,97.99554;Inherit;False;Tri2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;46;-1055.149,1529.574;Inherit;False;32;Tri1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;49;-1032.007,1684.809;Inherit;False;Constant;_Color3;Color 3;2;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;48;-1054.957,1362.738;Inherit;False;Constant;_Color2;Color 2;2;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;47;-1053.761,1610.347;Inherit;False;33;Tri2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-670.82,1524.647;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-695.3201,1420.347;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-609.8671,1667.451;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;50;-512.9722,1463.699;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;30;-936.4614,876.3962;Inherit;False;728.8278;504.3005;Fig 5;7;45;44;26;25;29;27;28;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;18;-948.1492,186.683;Inherit;False;832.8304;290.0538;Fig 4 forma 1;6;41;40;16;17;12;15;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;10;-911.6527,-230.9016;Inherit;False;741.5258;194.5694;Fig 2;4;37;36;5;4;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;24;-941.0469,520.5605;Inherit;False;819.7933;318.4197;Fig 4 forma 2;7;43;42;22;23;20;19;21;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;9;-989.7609,-476.7616;Inherit;False;805.6909;233.0234;Fig 1;4;35;34;3;8;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;55;-400.092,1571.484;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;11;-904.6993,-31.73676;Inherit;False;491.4177;186.9063;Fig 3;3;39;38;6;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SaturateNode;17;-449.4407,246.7409;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;43;-912.3448,691.5905;Inherit;False;33;Tri2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;25;-886.4614,917.2963;Inherit;False;Constant;_Color0;Color 0;2;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;26;-893.377,1144.297;Inherit;False;Constant;_Color1;Color 1;2;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;44;-873.1248,1077.077;Inherit;False;32;Tri1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-576.7616,18.26322;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;45;-878.7456,1304.389;Inherit;False;33;Tri2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;19;-649.8044,570.5605;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;21;-273.8436,602.0886;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;34;-957.8734,-422.4157;Inherit;False;32;Tri1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;41;-917.3448,339.5905;Inherit;False;33;Tri2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-891.1237,228.3791;Inherit;False;32;Tri1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;20;-659.9756,713.7075;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;-917.1237,563.3792;Inherit;False;32;Tri1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;-850.3448,75.59052;Inherit;False;33;Tri2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-561.3796,1051.946;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;4;-336.9968,-180.9016;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5;-596.267,-173.2385;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;8;-350.9398,-426.7616;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3;-577.545,-414.7143;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;16;-282.7688,281.756;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-568.7443,1174.532;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;12;-654.4323,236.683;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;35;-947.2666,-341.3769;Inherit;False;33;Tri2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;56;-214.3457,1534.99;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;23;-460.3256,706.7397;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;-898.1237,-197.6209;Inherit;False;32;Tri1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;37;-880.3448,-109.4095;Inherit;False;33;Tri2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;38;-868.1237,-12.62088;Inherit;False;32;Tri1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;29;-384.9238,1116.011;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;22;-472.3931,581.5402;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-632.4761,350.3144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;127.5818,1263.353;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Ejercicio1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;32;0;1;0
WireConnection;33;0;2;0
WireConnection;52;0;47;0
WireConnection;52;1;49;0
WireConnection;51;0;48;0
WireConnection;51;1;46;0
WireConnection;53;0;46;0
WireConnection;53;1;47;0
WireConnection;50;0;51;0
WireConnection;50;1;52;0
WireConnection;55;0;50;0
WireConnection;55;1;53;0
WireConnection;17;0;12;0
WireConnection;6;0;38;0
WireConnection;6;1;39;0
WireConnection;19;0;42;0
WireConnection;19;1;43;0
WireConnection;21;0;22;0
WireConnection;21;1;23;0
WireConnection;20;0;43;0
WireConnection;20;1;42;0
WireConnection;27;0;44;0
WireConnection;27;1;25;0
WireConnection;4;0;5;0
WireConnection;5;0;36;0
WireConnection;5;1;37;0
WireConnection;8;0;3;0
WireConnection;3;0;34;0
WireConnection;3;1;35;0
WireConnection;16;0;17;0
WireConnection;16;1;15;0
WireConnection;28;0;45;0
WireConnection;28;1;26;0
WireConnection;12;0;40;0
WireConnection;12;1;41;0
WireConnection;56;0;55;0
WireConnection;23;0;20;0
WireConnection;29;0;27;0
WireConnection;29;1;28;0
WireConnection;22;0;19;0
WireConnection;15;0;40;0
WireConnection;15;1;41;0
WireConnection;0;0;56;0
ASEEND*/
//CHKSM=17E89361BF2799B5BD629902A81B8AD595C81B07