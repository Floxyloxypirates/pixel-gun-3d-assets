//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ProBuilder/HideVertices" {
Properties {
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "Geometry" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "Geometry" }
  GpuProgramID 45548
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
void main ()
{
  gl_Position = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
void main ()
{
  gl_Position = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
void main ()
{
  gl_Position = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
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
}
}
}
}