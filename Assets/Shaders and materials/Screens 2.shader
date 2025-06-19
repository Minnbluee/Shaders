// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Screens 2"
{
	Properties
	{
		_Color1("Color", Float) = 1
		_utc_obj_kunozi_alb("utc_obj_kunozi_alb", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _utc_obj_kunozi_alb;
		uniform float4 _utc_obj_kunozi_alb_ST;
		uniform float _Color1;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color4 = IsGammaSpace() ? float4(0.6084906,0.9953939,1,0) : float4(0.3285471,0.9895536,1,0);
			o.Albedo = color4.rgb;
			float2 uv_utc_obj_kunozi_alb = i.uv_texcoord * _utc_obj_kunozi_alb_ST.xy + _utc_obj_kunozi_alb_ST.zw;
			o.Emission = ( tex2D( _utc_obj_kunozi_alb, uv_utc_obj_kunozi_alb ) * _Color1 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
0;568;1324;418;842.4488;124.9502;1.143741;True;True
Node;AmplifyShaderEditor.RangedFloatNode;1;-434.0786,242.8005;Inherit;False;Property;_Color1;Color;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;5;-702.6136,-39.9961;Inherit;True;Property;_utc_obj_kunozi_alb;utc_obj_kunozi_alb;1;0;Create;True;0;0;0;False;0;False;-1;42892201669398f4b9121d3b4feb786b;42892201669398f4b9121d3b4feb786b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-236.0786,122.8005;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;4;-341.4951,-89.49062;Inherit;False;Constant;_Color2;Color 0;2;0;Create;True;0;0;0;False;0;False;0.6084906,0.9953939,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Screens 2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3;0;5;0
WireConnection;3;1;1;0
WireConnection;0;0;4;0
WireConnection;0;2;3;0
ASEEND*/
//CHKSM=2C59213807BF7F6A15B87ED01A585C6B4E10ABA5