//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Nature/Tree Soft Occlusion Leaves Rendertex" {
Properties {
_Color ("Main Color", Color) = (1,1,1,0)
_MainTex ("Main Texture", 2D) = "white" { }
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_HalfOverCutoff ("0.5 / Alpha cutoff", Range(0, 1)) = 1
_BaseLight ("Base Light", Range(0, 1)) = 0.35
_AO ("Amb. Occlusion", Range(0, 10)) = 2.4
_Occlusion ("Dir Occlusion", Range(0, 20)) = 7.5
_TreeInstanceColor ("TreeInstanceColor", Vector) = (1,1,1,1)
_TreeInstanceScale ("TreeInstanceScale", Vector) = (1,1,1,1)
_SquashAmount ("Squash", Float) = 1
}
SubShader {
 Tags { "QUEUE" = "AlphaTest" }
 Pass {
  Tags { "QUEUE" = "AlphaTest" }
  Cull Off
  Lighting On
  GpuProgramID 49758
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceColor;
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	float _Occlusion;
uniform 	float _AO;
uniform 	float _BaseLight;
uniform 	vec4 _Color;
uniform 	vec3 _TerrainTreeLightDirections[4];
uniform 	vec4 _TerrainTreeLightColors[4];
uniform 	float _HalfOverCutoff;
in  vec4 in_POSITION0;
in  vec4 in_TANGENT0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat0.xyz = vec3(_Occlusion) * _TerrainTreeLightDirections[0].xyz;
    u_xlat0.w = _AO;
    u_xlat0.x = dot(in_TANGENT0, u_xlat0);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x + _BaseLight;
    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
    u_xlat0.xyz = _TerrainTreeLightColors[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vec3(_Occlusion) * _TerrainTreeLightDirections[1].xyz;
    u_xlat1.w = _AO;
    u_xlat6 = dot(in_TANGENT0, u_xlat1);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = u_xlat6 + _BaseLight;
    u_xlat0.xyz = _TerrainTreeLightColors[1].xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(_Occlusion) * _TerrainTreeLightDirections[2].xyz;
    u_xlat1.w = _AO;
    u_xlat6 = dot(in_TANGENT0, u_xlat1);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = u_xlat6 + _BaseLight;
    u_xlat0.xyz = _TerrainTreeLightColors[2].xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(_Occlusion) * _TerrainTreeLightDirections[3].xyz;
    u_xlat1.w = _AO;
    u_xlat6 = dot(in_TANGENT0, u_xlat1);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = u_xlat6 + _BaseLight;
    u_xlat0.xyz = _TerrainTreeLightColors[3].xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * _TreeInstanceColor.xyz;
    vs_TEXCOORD1.w = _HalfOverCutoff * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat0.w + (-_Cutoff);
    SV_Target0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz;
    u_xlatb0 = u_xlat3<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 375
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %186 %196 %197 %214 %354 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpMemberDecorate %22 8 Offset 22 
                                                      OpMemberDecorate %22 9 Offset 22 
                                                      OpMemberDecorate %22 10 Offset 22 
                                                      OpMemberDecorate %22 11 Offset 22 
                                                      OpMemberDecorate %22 12 Offset 22 
                                                      OpMemberDecorate %22 13 Offset 22 
                                                      OpMemberDecorate %22 14 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %81 Location 81 
                                                      OpMemberDecorate %184 0 BuiltIn 184 
                                                      OpMemberDecorate %184 1 BuiltIn 184 
                                                      OpMemberDecorate %184 2 BuiltIn 184 
                                                      OpDecorate %184 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 196 
                                                      OpDecorate %197 Location 197 
                                                      OpDecorate %214 Location 214 
                                                      OpDecorate vs_TEXCOORD1 Location 354 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %12 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeStruct %17 %7 %18 %7 %7 %19 %7 %6 %6 %6 %6 %7 %20 %21 %6 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4; f32_4[4]; f32_4; f32_4; f32_4[4]; f32_4; f32; f32; f32; f32; f32_4; f32_3[4]; f32_4[4]; f32;}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 4 
                                              %27 = OpTypePointer Uniform %7 
                               Private f32_4* %34 = OpVariable Private 
                                          i32 %37 = OpConstant 5 
                                          i32 %38 = OpConstant 1 
                                          i32 %45 = OpConstant 0 
                                          i32 %57 = OpConstant 2 
                                 Input f32_4* %81 = OpVariable Input 
                                              %92 = OpTypePointer Private %6 
                                 Private f32* %93 = OpVariable Private 
                                          i32 %94 = OpConstant 6 
                                         u32 %102 = OpConstant 3 
                                             %103 = OpTypePointer Uniform %6 
                                         i32 %127 = OpConstant 7 
                                         i32 %159 = OpConstant 3 
                                         u32 %182 = OpConstant 1 
                                             %183 = OpTypeArray %6 %182 
                                             %184 = OpTypeStruct %7 %6 %183 
                                             %185 = OpTypePointer Output %184 
        Output struct {f32_4; f32; f32[1];}* %186 = OpVariable Output 
                                             %194 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %197 = OpVariable Input 
                                         i32 %199 = OpConstant 8 
                                         i32 %203 = OpConstant 12 
                                             %204 = OpTypePointer Uniform %12 
                                         i32 %210 = OpConstant 9 
                                Input f32_4* %214 = OpVariable Input 
                                         u32 %218 = OpConstant 0 
                                         f32 %222 = OpConstant 3.674022E-40 
                                         i32 %227 = OpConstant 10 
                                             %232 = OpTypePointer Private %12 
                              Private f32_3* %233 = OpVariable Private 
                                         i32 %241 = OpConstant 13 
                                         i32 %347 = OpConstant 11 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %363 = OpConstant 14 
                                         f32 %366 = OpConstant 3.674022E-40 
                                             %368 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %28 = OpAccessChain %24 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                                        f32_3 %31 = OpFMul %14 %30 
                                        f32_4 %32 = OpLoad %9 
                                        f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                                      OpStore %9 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_3 %36 = OpVectorShuffle %35 %35 1 1 1 
                               Uniform f32_4* %39 = OpAccessChain %24 %37 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                                        f32_3 %42 = OpFMul %36 %41 
                                        f32_4 %43 = OpLoad %34 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 6 3 
                                                      OpStore %34 %44 
                               Uniform f32_4* %46 = OpAccessChain %24 %37 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 0 0 
                                        f32_3 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %34 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                        f32_3 %54 = OpFAdd %51 %53 
                                        f32_4 %55 = OpLoad %34 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                      OpStore %34 %56 
                               Uniform f32_4* %58 = OpAccessChain %24 %37 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 2 2 2 
                                        f32_3 %63 = OpFMul %60 %62 
                                        f32_4 %64 = OpLoad %34 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFAdd %63 %65 
                                        f32_4 %67 = OpLoad %34 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                      OpStore %34 %68 
                                        f32_4 %69 = OpLoad %11 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_3 %71 = OpFNegate %70 
                               Uniform f32_4* %72 = OpAccessChain %24 %26 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFMul %71 %74 
                                        f32_4 %76 = OpLoad %34 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %34 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %34 %80 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 3 3 3 
                                        f32_4 %84 = OpLoad %34 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpFAdd %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                                      OpStore %9 %91 
                               Uniform f32_4* %95 = OpAccessChain %24 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_4 %98 = OpLoad %9 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                         f32 %100 = OpDot %97 %99 
                                                      OpStore %93 %100 
                                         f32 %101 = OpLoad %93 
                                Uniform f32* %104 = OpAccessChain %24 %94 %102 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFAdd %101 %105 
                                                      OpStore %93 %106 
                                         f32 %107 = OpLoad %93 
                                       f32_3 %108 = OpCompositeConstruct %107 %107 %107 
                                       f32_3 %109 = OpFNegate %108 
                              Uniform f32_4* %110 = OpAccessChain %24 %94 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFMul %109 %112 
                                       f32_4 %114 = OpLoad %9 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %113 %115 
                                       f32_4 %117 = OpLoad %34 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                      OpStore %34 %118 
                                       f32_4 %119 = OpLoad %9 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_4 %121 = OpLoad %34 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFNegate %122 
                                       f32_3 %124 = OpFAdd %120 %123 
                                       f32_4 %125 = OpLoad %9 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %9 %126 
                                Uniform f32* %128 = OpAccessChain %24 %127 
                                         f32 %129 = OpLoad %128 
                                       f32_3 %130 = OpCompositeConstruct %129 %129 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %34 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpFAdd %133 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %9 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_4 %140 = OpVectorShuffle %139 %139 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %24 %45 %38 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %140 %142 
                                                      OpStore %34 %143 
                              Uniform f32_4* %144 = OpAccessChain %24 %45 %45 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %34 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %34 %150 
                              Uniform f32_4* %151 = OpAccessChain %24 %45 %57 
                                       f32_4 %152 = OpLoad %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_4 %154 = OpVectorShuffle %153 %153 2 2 2 2 
                                       f32_4 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %34 
                                       f32_4 %157 = OpFAdd %155 %156 
                                                      OpStore %9 %157 
                                       f32_4 %158 = OpLoad %9 
                              Uniform f32_4* %160 = OpAccessChain %24 %45 %159 
                                       f32_4 %161 = OpLoad %160 
                                       f32_4 %162 = OpFAdd %158 %161 
                                                      OpStore %9 %162 
                                       f32_4 %163 = OpLoad %9 
                                       f32_4 %164 = OpVectorShuffle %163 %163 1 1 1 1 
                              Uniform f32_4* %165 = OpAccessChain %24 %57 %38 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFMul %164 %166 
                                                      OpStore %34 %167 
                              Uniform f32_4* %168 = OpAccessChain %24 %57 %45 
                                       f32_4 %169 = OpLoad %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 0 0 0 0 
                                       f32_4 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %34 
                                       f32_4 %174 = OpFAdd %172 %173 
                                                      OpStore %34 %174 
                              Uniform f32_4* %175 = OpAccessChain %24 %57 %57 
                                       f32_4 %176 = OpLoad %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %177 2 2 2 2 
                                       f32_4 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %34 
                                       f32_4 %181 = OpFAdd %179 %180 
                                                      OpStore %34 %181 
                              Uniform f32_4* %187 = OpAccessChain %24 %57 %159 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %9 
                                       f32_4 %190 = OpVectorShuffle %189 %189 3 3 3 3 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %34 
                                       f32_4 %193 = OpFAdd %191 %192 
                               Output f32_4* %195 = OpAccessChain %186 %45 
                                                      OpStore %195 %193 
                                       f32_4 %198 = OpLoad %197 
                                                      OpStore vs_TEXCOORD0 %198 
                                Uniform f32* %200 = OpAccessChain %24 %199 
                                         f32 %201 = OpLoad %200 
                                       f32_3 %202 = OpCompositeConstruct %201 %201 %201 
                              Uniform f32_3* %205 = OpAccessChain %24 %203 %45 
                                       f32_3 %206 = OpLoad %205 
                                       f32_3 %207 = OpFMul %202 %206 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
                                                      OpStore %9 %209 
                                Uniform f32* %211 = OpAccessChain %24 %210 
                                         f32 %212 = OpLoad %211 
                                Private f32* %213 = OpAccessChain %9 %102 
                                                      OpStore %213 %212 
                                       f32_4 %215 = OpLoad %214 
                                       f32_4 %216 = OpLoad %9 
                                         f32 %217 = OpDot %215 %216 
                                Private f32* %219 = OpAccessChain %9 %218 
                                                      OpStore %219 %217 
                                Private f32* %220 = OpAccessChain %9 %218 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpExtInst %1 40 %221 %222 
                                Private f32* %224 = OpAccessChain %9 %218 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %9 %218 
                                         f32 %226 = OpLoad %225 
                                Uniform f32* %228 = OpAccessChain %24 %227 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFAdd %226 %229 
                                Private f32* %231 = OpAccessChain %9 %218 
                                                      OpStore %231 %230 
                              Uniform f32_4* %234 = OpAccessChain %24 %38 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                              Uniform f32_4* %237 = OpAccessChain %24 %38 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFAdd %236 %239 
                                                      OpStore %233 %240 
                              Uniform f32_4* %242 = OpAccessChain %24 %241 %45 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_4 %245 = OpLoad %9 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 0 0 
                                       f32_3 %247 = OpFMul %244 %246 
                                       f32_3 %248 = OpLoad %233 
                                       f32_3 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %9 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %9 %251 
                                Uniform f32* %252 = OpAccessChain %24 %199 
                                         f32 %253 = OpLoad %252 
                                       f32_3 %254 = OpCompositeConstruct %253 %253 %253 
                              Uniform f32_3* %255 = OpAccessChain %24 %203 %38 
                                       f32_3 %256 = OpLoad %255 
                                       f32_3 %257 = OpFMul %254 %256 
                                       f32_4 %258 = OpLoad %34 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %34 %259 
                                Uniform f32* %260 = OpAccessChain %24 %210 
                                         f32 %261 = OpLoad %260 
                                Private f32* %262 = OpAccessChain %34 %102 
                                                      OpStore %262 %261 
                                       f32_4 %263 = OpLoad %214 
                                       f32_4 %264 = OpLoad %34 
                                         f32 %265 = OpDot %263 %264 
                                                      OpStore %93 %265 
                                         f32 %266 = OpLoad %93 
                                         f32 %267 = OpExtInst %1 40 %266 %222 
                                                      OpStore %93 %267 
                                         f32 %268 = OpLoad %93 
                                Uniform f32* %269 = OpAccessChain %24 %227 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFAdd %268 %270 
                                                      OpStore %93 %271 
                              Uniform f32_4* %272 = OpAccessChain %24 %241 %38 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                         f32 %275 = OpLoad %93 
                                       f32_3 %276 = OpCompositeConstruct %275 %275 %275 
                                       f32_3 %277 = OpFMul %274 %276 
                                       f32_4 %278 = OpLoad %9 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFAdd %277 %279 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %9 %282 
                                Uniform f32* %283 = OpAccessChain %24 %199 
                                         f32 %284 = OpLoad %283 
                                       f32_3 %285 = OpCompositeConstruct %284 %284 %284 
                              Uniform f32_3* %286 = OpAccessChain %24 %203 %57 
                                       f32_3 %287 = OpLoad %286 
                                       f32_3 %288 = OpFMul %285 %287 
                                       f32_4 %289 = OpLoad %34 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %34 %290 
                                Uniform f32* %291 = OpAccessChain %24 %210 
                                         f32 %292 = OpLoad %291 
                                Private f32* %293 = OpAccessChain %34 %102 
                                                      OpStore %293 %292 
                                       f32_4 %294 = OpLoad %214 
                                       f32_4 %295 = OpLoad %34 
                                         f32 %296 = OpDot %294 %295 
                                                      OpStore %93 %296 
                                         f32 %297 = OpLoad %93 
                                         f32 %298 = OpExtInst %1 40 %297 %222 
                                                      OpStore %93 %298 
                                         f32 %299 = OpLoad %93 
                                Uniform f32* %300 = OpAccessChain %24 %227 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFAdd %299 %301 
                                                      OpStore %93 %302 
                              Uniform f32_4* %303 = OpAccessChain %24 %241 %57 
                                       f32_4 %304 = OpLoad %303 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                         f32 %306 = OpLoad %93 
                                       f32_3 %307 = OpCompositeConstruct %306 %306 %306 
                                       f32_3 %308 = OpFMul %305 %307 
                                       f32_4 %309 = OpLoad %9 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                       f32_3 %311 = OpFAdd %308 %310 
                                       f32_4 %312 = OpLoad %9 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
                                                      OpStore %9 %313 
                                Uniform f32* %314 = OpAccessChain %24 %199 
                                         f32 %315 = OpLoad %314 
                                       f32_3 %316 = OpCompositeConstruct %315 %315 %315 
                              Uniform f32_3* %317 = OpAccessChain %24 %203 %159 
                                       f32_3 %318 = OpLoad %317 
                                       f32_3 %319 = OpFMul %316 %318 
                                       f32_4 %320 = OpLoad %34 
                                       f32_4 %321 = OpVectorShuffle %320 %319 4 5 6 3 
                                                      OpStore %34 %321 
                                Uniform f32* %322 = OpAccessChain %24 %210 
                                         f32 %323 = OpLoad %322 
                                Private f32* %324 = OpAccessChain %34 %102 
                                                      OpStore %324 %323 
                                       f32_4 %325 = OpLoad %214 
                                       f32_4 %326 = OpLoad %34 
                                         f32 %327 = OpDot %325 %326 
                                                      OpStore %93 %327 
                                         f32 %328 = OpLoad %93 
                                         f32 %329 = OpExtInst %1 40 %328 %222 
                                                      OpStore %93 %329 
                                         f32 %330 = OpLoad %93 
                                Uniform f32* %331 = OpAccessChain %24 %227 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFAdd %330 %332 
                                                      OpStore %93 %333 
                              Uniform f32_4* %334 = OpAccessChain %24 %241 %159 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                         f32 %337 = OpLoad %93 
                                       f32_3 %338 = OpCompositeConstruct %337 %337 %337 
                                       f32_3 %339 = OpFMul %336 %338 
                                       f32_4 %340 = OpLoad %9 
                                       f32_3 %341 = OpVectorShuffle %340 %340 0 1 2 
                                       f32_3 %342 = OpFAdd %339 %341 
                                       f32_4 %343 = OpLoad %9 
                                       f32_4 %344 = OpVectorShuffle %343 %342 4 5 6 3 
                                                      OpStore %9 %344 
                                       f32_4 %345 = OpLoad %9 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                              Uniform f32_4* %348 = OpAccessChain %24 %347 
                                       f32_4 %349 = OpLoad %348 
                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
                                       f32_3 %351 = OpFMul %346 %350 
                                       f32_4 %352 = OpLoad %9 
                                       f32_4 %353 = OpVectorShuffle %352 %351 4 5 6 3 
                                                      OpStore %9 %353 
                                       f32_4 %355 = OpLoad %9 
                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
                              Uniform f32_4* %357 = OpAccessChain %24 %159 
                                       f32_4 %358 = OpLoad %357 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                       f32_3 %360 = OpFMul %356 %359 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %362 
                                Uniform f32* %364 = OpAccessChain %24 %363 
                                         f32 %365 = OpLoad %364 
                                         f32 %367 = OpFMul %365 %366 
                                 Output f32* %369 = OpAccessChain vs_TEXCOORD1 %102 
                                                      OpStore %369 %367 
                                 Output f32* %370 = OpAccessChain %186 %45 %182 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFNegate %371 
                                 Output f32* %373 = OpAccessChain %186 %45 %182 
                                                      OpStore %373 %372 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 72
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %43 %47 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %32 0 Offset 32 
                                             OpDecorate %32 Block 
                                             OpDecorate %34 DescriptorSet 34 
                                             OpDecorate %34 Binding 34 
                                             OpDecorate %43 Location 43 
                                             OpDecorate vs_TEXCOORD1 Location 47 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %22 = OpTypeVector %6 2 
                                     %26 = OpTypePointer Private %6 
                        Private f32* %27 = OpVariable Private 
                                     %28 = OpTypeInt 32 0 
                                 u32 %29 = OpConstant 3 
                                     %32 = OpTypeStruct %6 
                                     %33 = OpTypePointer Uniform %32 
              Uniform struct {f32;}* %34 = OpVariable Uniform 
                                     %35 = OpTypeInt 32 1 
                                 i32 %36 = OpConstant 0 
                                     %37 = OpTypePointer Uniform %6 
                                     %42 = OpTypePointer Output %7 
                       Output f32_4* %43 = OpVariable Output 
                                     %44 = OpTypeVector %6 3 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %53 = OpTypeBool 
                                     %54 = OpTypePointer Private %53 
                       Private bool* %55 = OpVariable Private 
                                 f32 %57 = OpConstant 3.674022E-40 
                                 i32 %60 = OpConstant 1 
                                 i32 %62 = OpConstant -1 
                                 f32 %68 = OpConstant 3.674022E-40 
                                     %69 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %23 = OpLoad vs_TEXCOORD0 
                               f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                             OpStore %9 %25 
                        Private f32* %30 = OpAccessChain %9 %29 
                                 f32 %31 = OpLoad %30 
                        Uniform f32* %38 = OpAccessChain %34 %36 
                                 f32 %39 = OpLoad %38 
                                 f32 %40 = OpFNegate %39 
                                 f32 %41 = OpFAdd %31 %40 
                                             OpStore %27 %41 
                               f32_4 %45 = OpLoad %9 
                               f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                               f32_4 %48 = OpLoad vs_TEXCOORD1 
                               f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                               f32_3 %50 = OpFMul %46 %49 
                               f32_4 %51 = OpLoad %43 
                               f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                             OpStore %43 %52 
                                 f32 %56 = OpLoad %27 
                                bool %58 = OpFOrdLessThan %56 %57 
                                             OpStore %55 %58 
                                bool %59 = OpLoad %55 
                                 i32 %61 = OpSelect %59 %60 %36 
                                 i32 %63 = OpIMul %61 %62 
                                bool %64 = OpINotEqual %63 %36 
                                             OpSelectionMerge %66 None 
                                             OpBranchConditional %64 %65 %66 
                                     %65 = OpLabel 
                                             OpKill
                                     %66 = OpLabel 
                         Output f32* %70 = OpAccessChain %43 %29 
                                             OpStore %70 %68 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}