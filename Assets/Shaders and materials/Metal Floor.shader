// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Metal Floor"
{
	Properties
	{
		_Metal052C_1KPNG_NormalDX("Metal052C_1K-PNG_NormalDX", 2D) = "white" {}
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

		uniform sampler2D _Metal052C_1KPNG_NormalDX;
		uniform float4 _Metal052C_1KPNG_NormalDX_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Metal052C_1KPNG_NormalDX = i.uv_texcoord * _Metal052C_1KPNG_NormalDX_ST.xy + _Metal052C_1KPNG_NormalDX_ST.zw;
			o.Normal = tex2D( _Metal052C_1KPNG_NormalDX, uv_Metal052C_1KPNG_NormalDX ).rgb;
			float4 color1 = IsGammaSpace() ? float4(0.2972588,0.3252626,0.3773585,0) : float4(0.07188901,0.08637635,0.1175492,0);
			o.Albedo = color1.rgb;
			o.Metallic = 0.2;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
690;95;1133;561;975.7191;334.7695;1.722493;True;True
Node;AmplifyShaderEditor.ColorNode;1;-304.3074,-223.2365;Inherit;False;Constant;_Color0;Color 0;0;0;Create;True;0;0;0;False;0;False;0.2972588,0.3252626,0.3773585,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-371.4848,-43.70404;Inherit;True;Property;_Metal052C_1KPNG_NormalDX;Metal052C_1K-PNG_NormalDX;0;0;Create;True;0;0;0;False;0;False;-1;5671aeb7dbde47644b3ba84317711e69;5671aeb7dbde47644b3ba84317711e69;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2;-222.8622,162.931;Inherit;False;Constant;_Float0;Float 0;0;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;208.2597,-18.52493;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Metal Floor;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;1;0
WireConnection;0;1;5;0
WireConnection;0;3;2;0
ASEEND*/
//CHKSM=AF3F9BE837F10DF2DCD822C930D542B552D51B1C