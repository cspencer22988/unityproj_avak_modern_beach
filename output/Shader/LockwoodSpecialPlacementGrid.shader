Shader "Lockwood/Special/PlacementGrid" {
	Properties {
		_Color ("_Color", Vector) = (1,1,1,1)
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "False" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "False" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			GpuProgramID 23210
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  tmpvar_1.xzw = tmpvar_2.xzw;
					  tmpvar_1.y = (tmpvar_2.y + 0.05);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xz * 1.5);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _Color;
					highp vec4 xlat_mutable_Color;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutable_Color.xyz = _Color.xyz;
					  lowp vec4 tmpvar_1;
					  highp vec2 subGrid_2;
					  highp vec2 mainGrid_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = ((xlv_TEXCOORD0 + 0.0075) * 4.0);
					  subGrid_2 = (tmpvar_4 - floor(tmpvar_4));
					  mainGrid_3 = (xlv_TEXCOORD0 - floor(xlv_TEXCOORD0));
					  subGrid_2 = (clamp ((
					    (subGrid_2 - 0.92)
					   * 1000.0), 0.0, 1.0) * 0.5);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = clamp (((mainGrid_3 - 0.96) * 1000.0), 0.0, 1.0);
					  mainGrid_3 = tmpvar_5;
					  xlat_mutable_Color.w = (_Color.w * (max (
					    max (subGrid_2.x, subGrid_2.y)
					  , 
					    max (tmpvar_5.x, tmpvar_5.y)
					  ) + 0.25));
					  tmpvar_1 = xlat_mutable_Color;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  tmpvar_1.xzw = tmpvar_2.xzw;
					  tmpvar_1.y = (tmpvar_2.y + 0.05);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xz * 1.5);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _Color;
					highp vec4 xlat_mutable_Color;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutable_Color.xyz = _Color.xyz;
					  lowp vec4 tmpvar_1;
					  highp vec2 subGrid_2;
					  highp vec2 mainGrid_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = ((xlv_TEXCOORD0 + 0.0075) * 4.0);
					  subGrid_2 = (tmpvar_4 - floor(tmpvar_4));
					  mainGrid_3 = (xlv_TEXCOORD0 - floor(xlv_TEXCOORD0));
					  subGrid_2 = (clamp ((
					    (subGrid_2 - 0.92)
					   * 1000.0), 0.0, 1.0) * 0.5);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = clamp (((mainGrid_3 - 0.96) * 1000.0), 0.0, 1.0);
					  mainGrid_3 = tmpvar_5;
					  xlat_mutable_Color.w = (_Color.w * (max (
					    max (subGrid_2.x, subGrid_2.y)
					  , 
					    max (tmpvar_5.x, tmpvar_5.y)
					  ) + 0.25));
					  tmpvar_1 = xlat_mutable_Color;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  tmpvar_1.xzw = tmpvar_2.xzw;
					  tmpvar_1.y = (tmpvar_2.y + 0.05);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xz * 1.5);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _Color;
					highp vec4 xlat_mutable_Color;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutable_Color.xyz = _Color.xyz;
					  lowp vec4 tmpvar_1;
					  highp vec2 subGrid_2;
					  highp vec2 mainGrid_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = ((xlv_TEXCOORD0 + 0.0075) * 4.0);
					  subGrid_2 = (tmpvar_4 - floor(tmpvar_4));
					  mainGrid_3 = (xlv_TEXCOORD0 - floor(xlv_TEXCOORD0));
					  subGrid_2 = (clamp ((
					    (subGrid_2 - 0.92)
					   * 1000.0), 0.0, 1.0) * 0.5);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = clamp (((mainGrid_3 - 0.96) * 1000.0), 0.0, 1.0);
					  mainGrid_3 = tmpvar_5;
					  xlat_mutable_Color.w = (_Color.w * (max (
					    max (subGrid_2.x, subGrid_2.y)
					  , 
					    max (tmpvar_5.x, tmpvar_5.y)
					  ) + 0.25));
					  tmpvar_1 = xlat_mutable_Color;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
	}
}