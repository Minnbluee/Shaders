// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VertexMap"
{
	Properties
	{
		_DirtTex("DirtTex", 2D) = "white" {}
		_GrassTex("GrassTex", 2D) = "white" {}
		_WaterMetallic("WaterMetallic", Range( 0 , 1)) = 0.6438845
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
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _DirtTex;
		uniform float4 _DirtTex_ST;
		uniform sampler2D _GrassTex;
		uniform float4 _GrassTex_ST;
		uniform float _WaterMetallic;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_DirtTex = i.uv_texcoord * _DirtTex_ST.xy + _DirtTex_ST.zw;
			float2 uv_GrassTex = i.uv_texcoord * _GrassTex_ST.xy + _GrassTex_ST.zw;
			float4 lerpResult4 = lerp( tex2D( _DirtTex, uv_DirtTex ) , tex2D( _GrassTex, uv_GrassTex ) , i.vertexColor.r);
			float4 color8 = IsGammaSpace() ? float4(0.5129049,0.7199404,0.9622642,0) : float4(0.2261808,0.4769118,0.9162945,0);
			float4 lerpResult9 = lerp( float4( 1,1,1,0 ) , color8 , i.vertexColor.b);
			o.Albedo = ( lerpResult4 * lerpResult9 ).rgb;
			o.Metallic = ( i.vertexColor.b * _WaterMetallic );
			float temp_output_1_3 = i.vertexColor.b;
			o.Smoothness = temp_output_1_3;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
0;453;1533;533;1109.656;348.802;1.21458;True;True
Node;AmplifyShaderEditor.VertexColorNode;1;-789.0927,115.1418;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;-492.6497,-98.59868;Inherit;False;Constant;_Color0;Color 0;3;0;Create;True;0;0;0;False;0;False;0.5129049,0.7199404,0.9622642,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-918.7353,-471.3803;Inherit;True;Property;_DirtTex;DirtTex;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-921.8882,-290.0845;Inherit;True;Property;_GrassTex;GrassTex;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-272.8102,156.463;Inherit;False;Property;_WaterMetallic;WaterMetallic;2;0;Create;True;0;0;0;False;0;False;0.6438845;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4;-417.6458,-385.7292;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;9;-192.6487,-85.23828;Inherit;False;3;0;COLOR;1,1,1,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-31.10881,98.16327;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-31.1091,-142.3235;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;279.5804,-185.083;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;VertexMap;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;0;2;0
WireConnection;4;1;3;0
WireConnection;4;2;1;1
WireConnection;9;1;8;0
WireConnection;9;2;1;3
WireConnection;6;0;1;3
WireConnection;6;1;5;0
WireConnection;7;0;4;0
WireConnection;7;1;9;0
WireConnection;0;0;7;0
WireConnection;0;3;6;0
WireConnection;0;4;1;3
ASEEND*/
//CHKSM=22EECB3B893D1B17739D1C5D9BC29AB83551CEDF