Shader "LKWD/Cutout/LightmapTweak Wind" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
		_LightmapGain ("Lightmap gain amount", Float) = 0.5
		_LightmapFlatten ("Lightmap flatten multiplier", Float) = 0.66
		_WindMainFlutter ("Wind main flutter factor", Float) = 0.5
		_WindEdgeFlutter ("Wind edge flutter factor", Float) = 0.1
		_WindFlutterFrequency ("Wind flutter frequency", Float) = 0.5
	}
	SubShader {
		LOD 100
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
		Pass {
			LOD 100
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
			GpuProgramID 34733
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = pos_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp float x_2;
					  x_2 = (tmpvar_1.w - _Cutoff);
					  if ((x_2 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = pos_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp float x_2;
					  x_2 = (tmpvar_1.w - _Cutoff);
					  if ((x_2 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = pos_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp float x_2;
					  x_2 = (tmpvar_1.w - _Cutoff);
					  if ((x_2 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((tmpvar_8.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((tmpvar_8.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((tmpvar_8.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_8.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_8.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_8.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_8.z);
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_8.z);
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp float _WindMainFlutter;
					uniform highp float _WindEdgeFlutter;
					uniform highp float _WindFlutterFrequency;
					uniform highp float _WindGlobalIntensity;
					uniform highp vec3 _WindGlobalDirection;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 pos_1;
					  pos_1.w = _glesVertex.w;
					  highp mat3 tmpvar_2;
					  tmpvar_2[0] = unity_WorldToObject[0].xyz;
					  tmpvar_2[1] = unity_WorldToObject[1].xyz;
					  tmpvar_2[2] = unity_WorldToObject[2].xyz;
					  highp float tmpvar_3;
					  tmpvar_3 = (dot ((unity_ObjectToWorld * _glesVertex), vec4(1.0, 1.0, 1.0, 1.0)) * 0.01);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = (tmpvar_3 * 8.0);
					  tmpvar_4.y = tmpvar_3;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = abs(((
					    fract((((
					      fract(((tmpvar_4 + (_Time.y * _WindFlutterFrequency)).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_6;
					  tmpvar_6 = ((tmpvar_5 * tmpvar_5) * (3.0 - (2.0 * tmpvar_5)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_6.xz + tmpvar_6.yw);
					  pos_1.xyz = (_glesVertex.xyz + ((
					    (_glesNormal * (((_WindEdgeFlutter * tmpvar_7.x) * _glesColor.x) * ((_glesColor.y * -2.0) + 1.0)))
					   + 
					    ((tmpvar_2 * (_WindGlobalDirection * _WindMainFlutter)) * (tmpvar_7.y * _glesColor.z))
					  ) * _WindGlobalIntensity));
					  highp vec4 tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = pos_1.xyz;
					  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_8.z);
					  gl_Position = tmpvar_8;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 final_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  final_1.w = tmpvar_2.w;
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  final_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
					  lowp float x_4;
					  x_4 = (tmpvar_2.w - _Cutoff);
					  if ((x_4 < 0.0)) {
					    discard;
					  };
					  gl_FragData[0] = final_1;
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
			LOD 100
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
			Cull Off
			GpuProgramID 82462
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 vertex_4;
					  vertex_4 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_5;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_4.z = tmpvar_5;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_6;
					    if ((vertex_4.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_4.z = tmpvar_6;
					  };
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = vertex_4.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_2.zw = vec2(0.0, 0.0);
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying mediump vec4 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 col_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  col_1 = tmpvar_4;
					  tmpvar_2 = (col_1.xyz * col_1.w);
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
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 vertex_4;
					  vertex_4 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_5;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_4.z = tmpvar_5;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_6;
					    if ((vertex_4.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_4.z = tmpvar_6;
					  };
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = vertex_4.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_2.zw = vec2(0.0, 0.0);
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying mediump vec4 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 col_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  col_1 = tmpvar_4;
					  tmpvar_2 = (col_1.xyz * col_1.w);
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
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 vertex_4;
					  vertex_4 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_5;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_4.z = tmpvar_5;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_6;
					    if ((vertex_4.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_4.z = tmpvar_6;
					  };
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = vertex_4.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_2.zw = vec2(0.0, 0.0);
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying mediump vec4 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 col_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  col_1 = tmpvar_4;
					  tmpvar_2 = (col_1.xyz * col_1.w);
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
	Fallback "LKWD/Cutout/LightmapTweak"
}