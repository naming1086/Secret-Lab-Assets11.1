//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Nature/Tree Creator Albedo Rendertex" {
Properties {
_TranslucencyColor ("Translucency Color", Color) = (0.73,0.85,0.41,1)
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_HalfOverCutoff ("0.5 / alpha cutoff", Range(0, 1)) = 1
_TranslucencyViewDependency ("View dependency", Range(0, 1)) = 0.7
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_BumpSpecMap ("Normalmap (GA) Spec (R) Shadow Offset (B)", 2D) = "bump" { }
_TranslucencyMap ("Trans (B) Gloss(A)", 2D) = "white" { }
}
SubShader {
 Pass {
  GpuProgramID 51150
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_TANGENT0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
    u_xlat0.xyz = in_NORMAL0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = -abs(in_TANGENT0.w) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_COLOR0.www;
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
UNITY_LOCATION(1) uniform  sampler2D _TranslucencyMap;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat0.w + (-_Cutoff);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat3<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0 = texture(_TranslucencyMap, vs_TEXCOORD0.xy);
    SV_Target0.w = u_xlat0.z;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 232
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %74 %139 %153 %205 %217 %218 %222 %223 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %74 Location 74 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %153 Location 153 
                                                      OpMemberDecorate %203 0 BuiltIn 203 
                                                      OpMemberDecorate %203 1 BuiltIn 203 
                                                      OpMemberDecorate %203 2 BuiltIn 203 
                                                      OpDecorate %203 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 217 
                                                      OpDecorate %218 Location 218 
                                                      OpDecorate vs_TEXCOORD1 Location 222 
                                                      OpDecorate %223 Location 223 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                              %16 = OpTypeStruct %12 %13 %14 %15 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4];}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 1 
                                              %21 = OpTypeVector %6 3 
                                              %22 = OpTypePointer Uniform %7 
                                          i32 %26 = OpConstant 2 
                                          i32 %33 = OpConstant 0 
                                          i32 %58 = OpConstant 3 
                                              %73 = OpTypePointer Input %21 
                                 Input f32_3* %74 = OpVariable Input 
                               Private f32_4* %80 = OpVariable Private 
                                             %136 = OpTypePointer Private %6 
                                Private f32* %137 = OpVariable Private 
                                             %138 = OpTypePointer Input %7 
                                Input f32_4* %139 = OpVariable Input 
                                         u32 %140 = OpConstant 3 
                                             %141 = OpTypePointer Input %6 
                                         f32 %146 = OpConstant 3.674022E-40 
                                Input f32_4* %153 = OpVariable Input 
                                         u32 %201 = OpConstant 1 
                                             %202 = OpTypeArray %6 %201 
                                             %203 = OpTypeStruct %7 %6 %202 
                                             %204 = OpTypePointer Output %203 
        Output struct {f32_4; f32; f32[1];}* %205 = OpVariable Output 
                                             %213 = OpTypePointer Output %7 
                                             %215 = OpTypeVector %6 2 
                                             %216 = OpTypePointer Output %215 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %218 = OpVariable Input 
                                             %221 = OpTypePointer Output %21 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                Input f32_4* %223 = OpVariable Input 
                                             %226 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %23 = OpAccessChain %18 %20 %20 
                                        f32_4 %24 = OpLoad %23 
                                        f32_3 %25 = OpVectorShuffle %24 %24 0 1 2 
                               Uniform f32_4* %27 = OpAccessChain %18 %26 %20 
                                        f32_4 %28 = OpLoad %27 
                                        f32_3 %29 = OpVectorShuffle %28 %28 1 1 1 
                                        f32_3 %30 = OpFMul %25 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 6 3 
                                                      OpStore %9 %32 
                               Uniform f32_4* %34 = OpAccessChain %18 %20 %33 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                               Uniform f32_4* %37 = OpAccessChain %18 %26 %20 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 0 0 
                                        f32_3 %40 = OpFMul %36 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                                        f32_3 %43 = OpFAdd %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpVectorShuffle %44 %43 4 5 6 3 
                                                      OpStore %9 %45 
                               Uniform f32_4* %46 = OpAccessChain %18 %20 %26 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                               Uniform f32_4* %49 = OpAccessChain %18 %26 %20 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 2 2 2 
                                        f32_3 %52 = OpFMul %48 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFAdd %52 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 6 3 
                                                      OpStore %9 %57 
                               Uniform f32_4* %59 = OpAccessChain %18 %20 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               Uniform f32_4* %62 = OpAccessChain %18 %26 %20 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 3 3 3 
                                        f32_3 %65 = OpFMul %61 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                                      OpStore %9 %70 
                                        f32_4 %71 = OpLoad %9 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                        f32_3 %75 = OpLoad %74 
                                        f32_3 %76 = OpVectorShuffle %75 %75 1 1 1 
                                        f32_3 %77 = OpFMul %72 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %18 %20 %20 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                               Uniform f32_4* %84 = OpAccessChain %18 %26 %33 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %18 %20 %33 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %18 %26 %33 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %18 %20 %26 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %18 %26 %33 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %18 %20 %58 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %18 %26 %33 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                                       f32_3 %126 = OpLoad %74 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_4 %128 = OpLoad %80 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                  Input f32* %142 = OpAccessChain %139 %140 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpExtInst %1 4 %143 
                                         f32 %145 = OpFNegate %144 
                                         f32 %147 = OpFAdd %145 %146 
                                                      OpStore %137 %147 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %150 = OpLoad %137 
                                       f32_3 %151 = OpCompositeConstruct %150 %150 %150 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %152 %155 
                                       f32_4 %157 = OpLoad %9 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %18 %33 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %80 %163 
                              Uniform f32_4* %164 = OpAccessChain %18 %33 %33 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %80 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %80 %170 
                              Uniform f32_4* %171 = OpAccessChain %18 %33 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %80 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %9 %177 
                                       f32_4 %178 = OpLoad %9 
                              Uniform f32_4* %179 = OpAccessChain %18 %33 %58 
                                       f32_4 %180 = OpLoad %179 
                                       f32_4 %181 = OpFAdd %178 %180 
                                                      OpStore %9 %181 
                                       f32_4 %182 = OpLoad %9 
                                       f32_4 %183 = OpVectorShuffle %182 %182 1 1 1 1 
                              Uniform f32_4* %184 = OpAccessChain %18 %58 %20 
                                       f32_4 %185 = OpLoad %184 
                                       f32_4 %186 = OpFMul %183 %185 
                                                      OpStore %80 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %58 %33 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %9 
                                       f32_4 %190 = OpVectorShuffle %189 %189 0 0 0 0 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %80 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %80 %193 
                              Uniform f32_4* %194 = OpAccessChain %18 %58 %26 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %9 
                                       f32_4 %197 = OpVectorShuffle %196 %196 2 2 2 2 
                                       f32_4 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %80 
                                       f32_4 %200 = OpFAdd %198 %199 
                                                      OpStore %80 %200 
                              Uniform f32_4* %206 = OpAccessChain %18 %58 %58 
                                       f32_4 %207 = OpLoad %206 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpVectorShuffle %208 %208 3 3 3 3 
                                       f32_4 %210 = OpFMul %207 %209 
                                       f32_4 %211 = OpLoad %80 
                                       f32_4 %212 = OpFAdd %210 %211 
                               Output f32_4* %214 = OpAccessChain %205 %33 
                                                      OpStore %214 %212 
                                       f32_4 %219 = OpLoad %218 
                                       f32_2 %220 = OpVectorShuffle %219 %219 0 1 
                                                      OpStore vs_TEXCOORD0 %220 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 3 3 3 
                                                      OpStore vs_TEXCOORD1 %225 
                                 Output f32* %227 = OpAccessChain %205 %33 %201 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                 Output f32* %230 = OpAccessChain %205 %33 %201 
                                                      OpStore %230 %229 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %42 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %31 0 Offset 31 
                                             OpDecorate %31 Block 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %42 Location 42 
                                             OpDecorate %63 DescriptorSet 63 
                                             OpDecorate %63 Binding 63 
                                             OpDecorate %65 DescriptorSet 65 
                                             OpDecorate %65 Binding 65 
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
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 3 
                                     %31 = OpTypeStruct %6 
                                     %32 = OpTypePointer Uniform %31 
              Uniform struct {f32;}* %33 = OpVariable Uniform 
                                     %34 = OpTypeInt 32 1 
                                 i32 %35 = OpConstant 0 
                                     %36 = OpTypePointer Uniform %6 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                     %43 = OpTypeVector %6 3 
                                     %48 = OpTypeBool 
                                     %49 = OpTypePointer Private %48 
                       Private bool* %50 = OpVariable Private 
                                 f32 %52 = OpConstant 3.674022E-40 
                                 i32 %55 = OpConstant 1 
                                 i32 %57 = OpConstant -1 
UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
            UniformConstant sampler* %65 = OpVariable UniformConstant 
                                 u32 %70 = OpConstant 2 
                                 u32 %72 = OpConstant 0 
                                     %76 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                        Uniform f32* %37 = OpAccessChain %33 %35 
                                 f32 %38 = OpLoad %37 
                                 f32 %39 = OpFNegate %38 
                                 f32 %40 = OpFAdd %30 %39 
                                             OpStore %26 %40 
                               f32_4 %44 = OpLoad %9 
                               f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                               f32_4 %46 = OpLoad %42 
                               f32_4 %47 = OpVectorShuffle %46 %45 4 5 6 3 
                                             OpStore %42 %47 
                                 f32 %51 = OpLoad %26 
                                bool %53 = OpFOrdLessThan %51 %52 
                                             OpStore %50 %53 
                                bool %54 = OpLoad %50 
                                 i32 %56 = OpSelect %54 %55 %35 
                                 i32 %58 = OpIMul %56 %57 
                                bool %59 = OpINotEqual %58 %35 
                                             OpSelectionMerge %61 None 
                                             OpBranchConditional %59 %60 %61 
                                     %60 = OpLabel 
                                             OpKill
                                     %61 = OpLabel 
                 read_only Texture2D %64 = OpLoad %63 
                             sampler %66 = OpLoad %65 
          read_only Texture2DSampled %67 = OpSampledImage %64 %66 
                               f32_2 %68 = OpLoad vs_TEXCOORD0 
                               f32_4 %69 = OpImageSampleImplicitLod %67 %68 
                                 f32 %71 = OpCompositeExtract %69 2 
                        Private f32* %73 = OpAccessChain %9 %72 
                                             OpStore %73 %71 
                        Private f32* %74 = OpAccessChain %9 %72 
                                 f32 %75 = OpLoad %74 
                         Output f32* %77 = OpAccessChain %42 %28 
                                             OpStore %77 %75 
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