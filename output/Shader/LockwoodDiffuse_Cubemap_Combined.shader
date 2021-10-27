Shader "Lockwood/Diffuse_Cubemap_Combined" {
	Properties {
		_MainColor ("Main Tint", Vector) = (1,1,1,0.5)
		_ReflectColor ("Reflection Tint", Vector) = (1,1,1,0.5)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Cube ("Reflection Cubemap", Cube) = "_Skybox" {}
	}
	SubShader {
		Tags { "QUEUE" = "Transparent+4" "RenderType" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent+4" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			GpuProgramID 24810
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_2);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_2);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_2);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = exp2(-((unity_FogParams.y * tmpvar_1.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = exp2(-((unity_FogParams.y * tmpvar_1.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = exp2(-((unity_FogParams.y * tmpvar_1.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_4;
					  tmpvar_4 = (unity_FogParams.x * tmpvar_1.z);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = exp2((-(tmpvar_4) * tmpvar_4));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_4;
					  tmpvar_4 = (unity_FogParams.x * tmpvar_1.z);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = exp2((-(tmpvar_4) * tmpvar_4));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp mat3 tmpvar_3;
					  tmpvar_3[0] = unity_WorldToObject[0].xyz;
					  tmpvar_3[1] = unity_WorldToObject[1].xyz;
					  tmpvar_3[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_4;
					  tmpvar_4 = (unity_FogParams.x * tmpvar_1.z);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD2 = (_glesNormal * tmpvar_3);
					  xlv_TEXCOORD3 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					  xlv_TEXCOORD4 = exp2((-(tmpvar_4) * tmpvar_4));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp samplerCube _Cube;
					uniform lowp vec3 _MainColor;
					uniform lowp vec4 _ReflectColor;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * _MainColor);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = normalize(xlv_TEXCOORD2);
					  highp vec3 tmpvar_4;
					  tmpvar_4 = (xlv_TEXCOORD3 - (2.0 * (
					    dot (tmpvar_3, xlv_TEXCOORD3)
					   * tmpvar_3)));
					  tex_1.xyz = (tex_1.xyz + (textureCube (_Cube, tmpvar_4) * _ReflectColor).xyz);
					  tex_1.w = _ReflectColor.w;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_5));
					  gl_FragData[0] = tex_1;
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
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent+4" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 85495
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_WorldToObject[0].xyz;
					  tmpvar_5[1] = unity_WorldToObject[1].xyz;
					  tmpvar_5[2] = unity_WorldToObject[2].xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = (_glesNormal * tmpvar_5);
					  xlv_TEXCOORD2 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform lowp vec3 _MainColor;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _MainColor);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_WorldToObject[0].xyz;
					  tmpvar_5[1] = unity_WorldToObject[1].xyz;
					  tmpvar_5[2] = unity_WorldToObject[2].xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = (_glesNormal * tmpvar_5);
					  xlv_TEXCOORD2 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform lowp vec3 _MainColor;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _MainColor);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_WorldToObject[0].xyz;
					  tmpvar_5[1] = unity_WorldToObject[1].xyz;
					  tmpvar_5[2] = unity_WorldToObject[2].xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = (_glesNormal * tmpvar_5);
					  xlv_TEXCOORD2 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform lowp vec3 _MainColor;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _MainColor);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
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
	Fallback "Lockwood/Diffuse"
}