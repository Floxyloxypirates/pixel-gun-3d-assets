//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Decal/Cutout VertexLit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 162427
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  lcolor_5 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  lcolor_5 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  lcolor_5 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lcolor_6 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_14), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_16), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_22), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_24), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_26), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_27;
  tmpvar_27 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_28;
  dirToLight_28 = tmpvar_27;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_28), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = _Color.w;
  lowp vec4 tmpvar_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = clamp (color_8, 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  lowp float tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_31 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_29;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_33));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lcolor_6 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_14), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_16), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_22), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_24), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_26), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_27;
  tmpvar_27 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_28;
  dirToLight_28 = tmpvar_27;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_28), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = _Color.w;
  lowp vec4 tmpvar_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = clamp (color_8, 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  lowp float tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_31 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_29;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_33));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lcolor_6 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_14), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_16), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_22), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_24), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_26), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_27;
  tmpvar_27 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_28;
  dirToLight_28 = tmpvar_27;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_28), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = _Color.w;
  lowp vec4 tmpvar_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = clamp (color_8, 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  lowp float tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_31 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_29;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_33));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  lowp float tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  lowp float tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  lowp float tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  lowp float tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_23;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  lowp float tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_23;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  lowp float tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_23;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "VertexLM" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 207310
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 2.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 2.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 2.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1;
  highp vec3 tmpvar_3;
  tmpvar_3 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_2).xyz;
  lowp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  lowp float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((
    sqrt(dot (tmpvar_3, tmpvar_3))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1;
  xlv_COLOR0 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 2.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1;
  highp vec3 tmpvar_3;
  tmpvar_3 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_2).xyz;
  lowp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  lowp float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((
    sqrt(dot (tmpvar_3, tmpvar_3))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1;
  xlv_COLOR0 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 2.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1;
  highp vec3 tmpvar_3;
  tmpvar_3 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_2).xyz;
  lowp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  lowp float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((
    sqrt(dot (tmpvar_3, tmpvar_3))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1;
  xlv_COLOR0 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 2.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_2;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "VertexLMRGBM" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 325390
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_Lightmap_ST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_Lightmap_ST.xy) + unity_Lightmap_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * tex_1.w);
  col_2 = (col_2 * 2.0);
  col_2 = (col_2 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD2);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 4.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_Lightmap_ST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_Lightmap_ST.xy) + unity_Lightmap_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * tex_1.w);
  col_2 = (col_2 * 2.0);
  col_2 = (col_2 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD2);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 4.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_Lightmap_ST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_Lightmap_ST.xy) + unity_Lightmap_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * tex_1.w);
  col_2 = (col_2 * 2.0);
  col_2 = (col_2 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD2);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 4.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_Lightmap_ST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp float xlv_TEXCOORD3;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1;
  highp vec3 tmpvar_3;
  tmpvar_3 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_2).xyz;
  lowp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  lowp float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((
    sqrt(dot (tmpvar_3, tmpvar_3))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1;
  xlv_COLOR0 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_Lightmap_ST.xy) + unity_Lightmap_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying lowp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * tex_1.w);
  col_2 = (col_2 * 2.0);
  col_2 = (col_2 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD2);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 4.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD3));
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_Lightmap_ST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp float xlv_TEXCOORD3;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1;
  highp vec3 tmpvar_3;
  tmpvar_3 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_2).xyz;
  lowp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  lowp float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((
    sqrt(dot (tmpvar_3, tmpvar_3))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1;
  xlv_COLOR0 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_Lightmap_ST.xy) + unity_Lightmap_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying lowp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * tex_1.w);
  col_2 = (col_2 * 2.0);
  col_2 = (col_2 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD2);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 4.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD3));
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_Lightmap_ST;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp float xlv_TEXCOORD3;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1;
  highp vec3 tmpvar_3;
  tmpvar_3 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_2).xyz;
  lowp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  lowp float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((
    sqrt(dot (tmpvar_3, tmpvar_3))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1;
  xlv_COLOR0 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_Lightmap_ST.xy) + unity_Lightmap_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying lowp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  col_2 = (tex_1 * tex_1.w);
  col_2 = (col_2 * 2.0);
  col_2 = (col_2 * _Color);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD2);
  tex_1 = tmpvar_4;
  col_2.xyz = (tmpvar_4 * col_2).xyz;
  col_2.xyz = (col_2 * 4.0).xyz;
  col_2.w = (tmpvar_4.w * xlv_COLOR0.w);
  if ((col_2.w <= _Cutoff)) {
    discard;
  };
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD3));
  gl_FragData[0] = col_2;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "CASTER"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  ZTest Less
  Cull Off
  Offset 1, 1
  GpuProgramID 39480
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp float x_1;
  x_1 = ((texture2D (_MainTex, xlv_TEXCOORD1).w * _Color.w) - _Cutoff);
  if ((x_1 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp float x_1;
  x_1 = ((texture2D (_MainTex, xlv_TEXCOORD1).w * _Color.w) - _Cutoff);
  if ((x_1 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp float x_1;
  x_1 = ((texture2D (_MainTex, xlv_TEXCOORD1).w * _Color.w) - _Cutoff);
  if ((x_1 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp float x_1;
  x_1 = ((texture2D (_MainTex, xlv_TEXCOORD1).w * _Color.w) - _Cutoff);
  if ((x_1 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_2;
  tmpvar_2 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_2 - (tmpvar_2.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp float x_1;
  x_1 = ((texture2D (_MainTex, xlv_TEXCOORD1).w * _Color.w) - _Cutoff);
  if ((x_1 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_2;
  tmpvar_2 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_2 - (tmpvar_2.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp float x_1;
  x_1 = ((texture2D (_MainTex, xlv_TEXCOORD1).w * _Color.w) - _Cutoff);
  if ((x_1 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_2;
  tmpvar_2 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_2 - (tmpvar_2.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
 Pass {
  Name "SHADOWCOLLECTOR"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCOLLECTOR" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  ZTest Less
  Offset -1, -1
  GpuProgramID 91589
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 zFar_4;
  highp vec4 zNear_5;
  lowp float x_6;
  x_6 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  bvec4 tmpvar_7;
  tmpvar_7 = greaterThanEqual (xlv_TEXCOORD4.wwww, _LightSplitsNear);
  lowp vec4 tmpvar_8;
  tmpvar_8 = vec4(tmpvar_7);
  zNear_5 = tmpvar_8;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (xlv_TEXCOORD4.wwww, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = vec4(tmpvar_9);
  zFar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (zNear_5 * zFar_4);
  highp float tmpvar_12;
  tmpvar_12 = clamp (((xlv_TEXCOORD4.w * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (xlv_TEXCOORD0 * tmpvar_11.x)
   + 
    (xlv_TEXCOORD1 * tmpvar_11.y)
  ) + (xlv_TEXCOORD2 * tmpvar_11.z)) + (xlv_TEXCOORD3 * tmpvar_11.w));
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_13.xy);
  mediump float tmpvar_15;
  if ((tmpvar_14.x < tmpvar_13.z)) {
    tmpvar_15 = 0.0;
  } else {
    tmpvar_15 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_15 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_12), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_16.y = tmpvar_17.y;
  enc_16.x = (tmpvar_17.x - (tmpvar_17.y * 0.003921569));
  res_2.zw = enc_16;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 zFar_4;
  highp vec4 zNear_5;
  lowp float x_6;
  x_6 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  bvec4 tmpvar_7;
  tmpvar_7 = greaterThanEqual (xlv_TEXCOORD4.wwww, _LightSplitsNear);
  lowp vec4 tmpvar_8;
  tmpvar_8 = vec4(tmpvar_7);
  zNear_5 = tmpvar_8;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (xlv_TEXCOORD4.wwww, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = vec4(tmpvar_9);
  zFar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (zNear_5 * zFar_4);
  highp float tmpvar_12;
  tmpvar_12 = clamp (((xlv_TEXCOORD4.w * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (xlv_TEXCOORD0 * tmpvar_11.x)
   + 
    (xlv_TEXCOORD1 * tmpvar_11.y)
  ) + (xlv_TEXCOORD2 * tmpvar_11.z)) + (xlv_TEXCOORD3 * tmpvar_11.w));
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_13.xy);
  mediump float tmpvar_15;
  if ((tmpvar_14.x < tmpvar_13.z)) {
    tmpvar_15 = 0.0;
  } else {
    tmpvar_15 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_15 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_12), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_16.y = tmpvar_17.y;
  enc_16.x = (tmpvar_17.x - (tmpvar_17.y * 0.003921569));
  res_2.zw = enc_16;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 zFar_4;
  highp vec4 zNear_5;
  lowp float x_6;
  x_6 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  bvec4 tmpvar_7;
  tmpvar_7 = greaterThanEqual (xlv_TEXCOORD4.wwww, _LightSplitsNear);
  lowp vec4 tmpvar_8;
  tmpvar_8 = vec4(tmpvar_7);
  zNear_5 = tmpvar_8;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (xlv_TEXCOORD4.wwww, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = vec4(tmpvar_9);
  zFar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (zNear_5 * zFar_4);
  highp float tmpvar_12;
  tmpvar_12 = clamp (((xlv_TEXCOORD4.w * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (xlv_TEXCOORD0 * tmpvar_11.x)
   + 
    (xlv_TEXCOORD1 * tmpvar_11.y)
  ) + (xlv_TEXCOORD2 * tmpvar_11.z)) + (xlv_TEXCOORD3 * tmpvar_11.w));
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_13.xy);
  mediump float tmpvar_15;
  if ((tmpvar_14.x < tmpvar_13.z)) {
    tmpvar_15 = 0.0;
  } else {
    tmpvar_15 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_15 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_12), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_16.y = tmpvar_17.y;
  enc_16.x = (tmpvar_17.x - (tmpvar_17.y * 0.003921569));
  res_2.zw = enc_16;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 cascadeWeights_4;
  lowp float x_5;
  x_5 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_5 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_10;
  tmpvar_10.x = dot (tmpvar_6, tmpvar_6);
  tmpvar_10.y = dot (tmpvar_7, tmpvar_7);
  tmpvar_10.z = dot (tmpvar_8, tmpvar_8);
  tmpvar_10.w = dot (tmpvar_9, tmpvar_9);
  bvec4 tmpvar_11;
  tmpvar_11 = lessThan (tmpvar_10, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_12;
  tmpvar_12 = vec4(tmpvar_11);
  cascadeWeights_4 = tmpvar_12;
  cascadeWeights_4.yzw = clamp ((cascadeWeights_4.yzw - cascadeWeights_4.xyz), 0.0, 1.0);
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD4.xyz - unity_ShadowFadeCenterAndType.xyz);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    sqrt(dot (tmpvar_13, tmpvar_13))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    (xlv_TEXCOORD0 * cascadeWeights_4.x)
   + 
    (xlv_TEXCOORD1 * cascadeWeights_4.y)
  ) + (xlv_TEXCOORD2 * cascadeWeights_4.z)) + (xlv_TEXCOORD3 * cascadeWeights_4.w));
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < tmpvar_15.z)) {
    tmpvar_17 = 0.0;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_17 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_14), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_18.y = tmpvar_19.y;
  enc_18.x = (tmpvar_19.x - (tmpvar_19.y * 0.003921569));
  res_2.zw = enc_18;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 cascadeWeights_4;
  lowp float x_5;
  x_5 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_5 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_10;
  tmpvar_10.x = dot (tmpvar_6, tmpvar_6);
  tmpvar_10.y = dot (tmpvar_7, tmpvar_7);
  tmpvar_10.z = dot (tmpvar_8, tmpvar_8);
  tmpvar_10.w = dot (tmpvar_9, tmpvar_9);
  bvec4 tmpvar_11;
  tmpvar_11 = lessThan (tmpvar_10, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_12;
  tmpvar_12 = vec4(tmpvar_11);
  cascadeWeights_4 = tmpvar_12;
  cascadeWeights_4.yzw = clamp ((cascadeWeights_4.yzw - cascadeWeights_4.xyz), 0.0, 1.0);
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD4.xyz - unity_ShadowFadeCenterAndType.xyz);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    sqrt(dot (tmpvar_13, tmpvar_13))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    (xlv_TEXCOORD0 * cascadeWeights_4.x)
   + 
    (xlv_TEXCOORD1 * cascadeWeights_4.y)
  ) + (xlv_TEXCOORD2 * cascadeWeights_4.z)) + (xlv_TEXCOORD3 * cascadeWeights_4.w));
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < tmpvar_15.z)) {
    tmpvar_17 = 0.0;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_17 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_14), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_18.y = tmpvar_19.y;
  enc_18.x = (tmpvar_19.x - (tmpvar_19.y * 0.003921569));
  res_2.zw = enc_18;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 cascadeWeights_4;
  lowp float x_5;
  x_5 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_5 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_10;
  tmpvar_10.x = dot (tmpvar_6, tmpvar_6);
  tmpvar_10.y = dot (tmpvar_7, tmpvar_7);
  tmpvar_10.z = dot (tmpvar_8, tmpvar_8);
  tmpvar_10.w = dot (tmpvar_9, tmpvar_9);
  bvec4 tmpvar_11;
  tmpvar_11 = lessThan (tmpvar_10, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_12;
  tmpvar_12 = vec4(tmpvar_11);
  cascadeWeights_4 = tmpvar_12;
  cascadeWeights_4.yzw = clamp ((cascadeWeights_4.yzw - cascadeWeights_4.xyz), 0.0, 1.0);
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD4.xyz - unity_ShadowFadeCenterAndType.xyz);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    sqrt(dot (tmpvar_13, tmpvar_13))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    (xlv_TEXCOORD0 * cascadeWeights_4.x)
   + 
    (xlv_TEXCOORD1 * cascadeWeights_4.y)
  ) + (xlv_TEXCOORD2 * cascadeWeights_4.z)) + (xlv_TEXCOORD3 * cascadeWeights_4.w));
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < tmpvar_15.z)) {
    tmpvar_17 = 0.0;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_17 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_14), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_18.y = tmpvar_19.y;
  enc_18.x = (tmpvar_19.x - (tmpvar_19.y * 0.003921569));
  res_2.zw = enc_18;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 zFar_4;
  highp vec4 zNear_5;
  lowp float x_6;
  x_6 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  bvec4 tmpvar_7;
  tmpvar_7 = greaterThanEqual (xlv_TEXCOORD4.wwww, _LightSplitsNear);
  lowp vec4 tmpvar_8;
  tmpvar_8 = vec4(tmpvar_7);
  zNear_5 = tmpvar_8;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (xlv_TEXCOORD4.wwww, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = vec4(tmpvar_9);
  zFar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (zNear_5 * zFar_4);
  highp float tmpvar_12;
  tmpvar_12 = clamp (((xlv_TEXCOORD4.w * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (xlv_TEXCOORD0 * tmpvar_11.x)
   + 
    (xlv_TEXCOORD1 * tmpvar_11.y)
  ) + (xlv_TEXCOORD2 * tmpvar_11.z)) + (xlv_TEXCOORD3 * tmpvar_11.w));
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_13.xy);
  mediump float tmpvar_15;
  if ((tmpvar_14.x < tmpvar_13.z)) {
    tmpvar_15 = 0.0;
  } else {
    tmpvar_15 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_15 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_12), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_16.y = tmpvar_17.y;
  enc_16.x = (tmpvar_17.x - (tmpvar_17.y * 0.003921569));
  res_2.zw = enc_16;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 zFar_4;
  highp vec4 zNear_5;
  lowp float x_6;
  x_6 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  bvec4 tmpvar_7;
  tmpvar_7 = greaterThanEqual (xlv_TEXCOORD4.wwww, _LightSplitsNear);
  lowp vec4 tmpvar_8;
  tmpvar_8 = vec4(tmpvar_7);
  zNear_5 = tmpvar_8;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (xlv_TEXCOORD4.wwww, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = vec4(tmpvar_9);
  zFar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (zNear_5 * zFar_4);
  highp float tmpvar_12;
  tmpvar_12 = clamp (((xlv_TEXCOORD4.w * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (xlv_TEXCOORD0 * tmpvar_11.x)
   + 
    (xlv_TEXCOORD1 * tmpvar_11.y)
  ) + (xlv_TEXCOORD2 * tmpvar_11.z)) + (xlv_TEXCOORD3 * tmpvar_11.w));
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_13.xy);
  mediump float tmpvar_15;
  if ((tmpvar_14.x < tmpvar_13.z)) {
    tmpvar_15 = 0.0;
  } else {
    tmpvar_15 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_15 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_12), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_16.y = tmpvar_17.y;
  enc_16.x = (tmpvar_17.x - (tmpvar_17.y * 0.003921569));
  res_2.zw = enc_16;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 zFar_4;
  highp vec4 zNear_5;
  lowp float x_6;
  x_6 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  bvec4 tmpvar_7;
  tmpvar_7 = greaterThanEqual (xlv_TEXCOORD4.wwww, _LightSplitsNear);
  lowp vec4 tmpvar_8;
  tmpvar_8 = vec4(tmpvar_7);
  zNear_5 = tmpvar_8;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (xlv_TEXCOORD4.wwww, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = vec4(tmpvar_9);
  zFar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (zNear_5 * zFar_4);
  highp float tmpvar_12;
  tmpvar_12 = clamp (((xlv_TEXCOORD4.w * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (xlv_TEXCOORD0 * tmpvar_11.x)
   + 
    (xlv_TEXCOORD1 * tmpvar_11.y)
  ) + (xlv_TEXCOORD2 * tmpvar_11.z)) + (xlv_TEXCOORD3 * tmpvar_11.w));
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_13.xy);
  mediump float tmpvar_15;
  if ((tmpvar_14.x < tmpvar_13.z)) {
    tmpvar_15 = 0.0;
  } else {
    tmpvar_15 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_15 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_12), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_16.y = tmpvar_17.y;
  enc_16.x = (tmpvar_17.x - (tmpvar_17.y * 0.003921569));
  res_2.zw = enc_16;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 cascadeWeights_4;
  lowp float x_5;
  x_5 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_5 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_10;
  tmpvar_10.x = dot (tmpvar_6, tmpvar_6);
  tmpvar_10.y = dot (tmpvar_7, tmpvar_7);
  tmpvar_10.z = dot (tmpvar_8, tmpvar_8);
  tmpvar_10.w = dot (tmpvar_9, tmpvar_9);
  bvec4 tmpvar_11;
  tmpvar_11 = lessThan (tmpvar_10, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_12;
  tmpvar_12 = vec4(tmpvar_11);
  cascadeWeights_4 = tmpvar_12;
  cascadeWeights_4.yzw = clamp ((cascadeWeights_4.yzw - cascadeWeights_4.xyz), 0.0, 1.0);
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD4.xyz - unity_ShadowFadeCenterAndType.xyz);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    sqrt(dot (tmpvar_13, tmpvar_13))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    (xlv_TEXCOORD0 * cascadeWeights_4.x)
   + 
    (xlv_TEXCOORD1 * cascadeWeights_4.y)
  ) + (xlv_TEXCOORD2 * cascadeWeights_4.z)) + (xlv_TEXCOORD3 * cascadeWeights_4.w));
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < tmpvar_15.z)) {
    tmpvar_17 = 0.0;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_17 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_14), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_18.y = tmpvar_19.y;
  enc_18.x = (tmpvar_19.x - (tmpvar_19.y * 0.003921569));
  res_2.zw = enc_18;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 cascadeWeights_4;
  lowp float x_5;
  x_5 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_5 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_10;
  tmpvar_10.x = dot (tmpvar_6, tmpvar_6);
  tmpvar_10.y = dot (tmpvar_7, tmpvar_7);
  tmpvar_10.z = dot (tmpvar_8, tmpvar_8);
  tmpvar_10.w = dot (tmpvar_9, tmpvar_9);
  bvec4 tmpvar_11;
  tmpvar_11 = lessThan (tmpvar_10, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_12;
  tmpvar_12 = vec4(tmpvar_11);
  cascadeWeights_4 = tmpvar_12;
  cascadeWeights_4.yzw = clamp ((cascadeWeights_4.yzw - cascadeWeights_4.xyz), 0.0, 1.0);
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD4.xyz - unity_ShadowFadeCenterAndType.xyz);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    sqrt(dot (tmpvar_13, tmpvar_13))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    (xlv_TEXCOORD0 * cascadeWeights_4.x)
   + 
    (xlv_TEXCOORD1 * cascadeWeights_4.y)
  ) + (xlv_TEXCOORD2 * cascadeWeights_4.z)) + (xlv_TEXCOORD3 * cascadeWeights_4.w));
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < tmpvar_15.z)) {
    tmpvar_17 = 0.0;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_17 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_14), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_18.y = tmpvar_19.y;
  enc_18.x = (tmpvar_19.x - (tmpvar_19.y * 0.003921569));
  res_2.zw = enc_18;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_2.xyz = tmpvar_4.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_2.w = -((unity_MatrixV * (unity_ObjectToWorld * tmpvar_5)).z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (unity_WorldToShadow[0] * tmpvar_4).xyz;
  xlv_TEXCOORD1 = (unity_WorldToShadow[1] * tmpvar_4).xyz;
  xlv_TEXCOORD2 = (unity_WorldToShadow[2] * tmpvar_4).xyz;
  xlv_TEXCOORD3 = (unity_WorldToShadow[3] * tmpvar_4).xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 res_2;
  mediump float shadow_3;
  highp vec4 cascadeWeights_4;
  lowp float x_5;
  x_5 = ((texture2D (_MainTex, xlv_TEXCOORD5).w * _Color.w) - _Cutoff);
  if ((x_5 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD4.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_10;
  tmpvar_10.x = dot (tmpvar_6, tmpvar_6);
  tmpvar_10.y = dot (tmpvar_7, tmpvar_7);
  tmpvar_10.z = dot (tmpvar_8, tmpvar_8);
  tmpvar_10.w = dot (tmpvar_9, tmpvar_9);
  bvec4 tmpvar_11;
  tmpvar_11 = lessThan (tmpvar_10, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_12;
  tmpvar_12 = vec4(tmpvar_11);
  cascadeWeights_4 = tmpvar_12;
  cascadeWeights_4.yzw = clamp ((cascadeWeights_4.yzw - cascadeWeights_4.xyz), 0.0, 1.0);
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD4.xyz - unity_ShadowFadeCenterAndType.xyz);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    sqrt(dot (tmpvar_13, tmpvar_13))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    (xlv_TEXCOORD0 * cascadeWeights_4.x)
   + 
    (xlv_TEXCOORD1 * cascadeWeights_4.y)
  ) + (xlv_TEXCOORD2 * cascadeWeights_4.z)) + (xlv_TEXCOORD3 * cascadeWeights_4.w));
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < tmpvar_15.z)) {
    tmpvar_17 = 0.0;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_3 = (_LightShadowData.x + (tmpvar_17 * (1.0 - _LightShadowData.x)));
  res_2.x = clamp ((shadow_3 + tmpvar_14), 0.0, 1.0);
  res_2.y = 1.0;
  highp vec2 enc_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = fract((vec2(1.0, 255.0) * (1.0 - 
    (xlv_TEXCOORD4.w * _ProjectionParams.w)
  )));
  enc_18.y = tmpvar_19.y;
  enc_18.x = (tmpvar_19.x - (tmpvar_19.y * 0.003921569));
  res_2.zw = enc_18;
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
}
}
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 359035
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  lcolor_5 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  lcolor_5 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  lcolor_5 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lcolor_6 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_14), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_16), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_22), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_24), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_26), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_27;
  tmpvar_27 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_28;
  dirToLight_28 = tmpvar_27;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_28), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = _Color.w;
  lowp vec4 tmpvar_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = clamp (color_8, 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  lowp float tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_31 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_29;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_33));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lcolor_6 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_14), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_16), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_22), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_24), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_26), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_27;
  tmpvar_27 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_28;
  dirToLight_28 = tmpvar_27;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_28), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = _Color.w;
  lowp vec4 tmpvar_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = clamp (color_8, 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  lowp float tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_31 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_29;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_33));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lcolor_6 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_14), 0.0) * _Color.xyz) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_16), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_22), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_24), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_26), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_27;
  tmpvar_27 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_28;
  dirToLight_28 = tmpvar_27;
  lcolor_6 = (lcolor_6 + min ((
    ((max (dot (eyeNormal_7, dirToLight_28), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = _Color.w;
  lowp vec4 tmpvar_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = clamp (color_8, 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  lowp float tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_31 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_29;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_33));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  lowp float tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  lowp float tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_18), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  lowp float tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  lowp float tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_23;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  lowp float tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_23;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lcolor_7 = (_Color.xyz * glstate_lightmodel_ambient.xyz);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_20), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  lowp float tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_23;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  if ((col_1.w <= _Cutoff)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
}
}
}
}