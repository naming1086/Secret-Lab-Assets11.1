//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Nature/Tree Soft Occlusion Bark Rendertex" {
Properties {
_Color ("Main Color", Color) = (1,1,1,0)
_MainTex ("Main Texture", 2D) = "white" { }
_BaseLight ("Base Light", Range(0, 1)) = 0.35
_AO ("Amb. Occlusion", Range(0, 10)) = 2.4
_TreeInstanceColor ("TreeInstanceColor", Vector) = (1,1,1,1)
_TreeInstanceScale ("TreeInstanceScale", Vector) = (1,1,1,1)
_SquashAmount ("Squash", Float) = 1
}
SubShader {
 Pass {
  Lighting On
  GpuProgramID 59742
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
uniform 	float _AO;
uniform 	float _BaseLight;
uniform 	vec4 _Color;
uniform 	vec3 _TerrainTreeLightDirections[4];
uniform 	vec4 _TerrainTreeLightColors[4];
in  vec4 in_POSITION0;
in  vec4 in_TANGENT0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
    u_xlat6 = dot(in_NORMAL0.xyz, _TerrainTreeLightDirections[0].xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat1.x = _AO * in_TANGENT0.w + _BaseLight;
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat0.xyz = _TerrainTreeLightColors[0].xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat6 = dot(in_NORMAL0.xyz, _TerrainTreeLightDirections[1].xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = u_xlat1.x * u_xlat6;
    u_xlat0.xyz = _TerrainTreeLightColors[1].xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat6 = dot(in_NORMAL0.xyz, _TerrainTreeLightDirections[2].xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = u_xlat1.x * u_xlat6;
    u_xlat0.xyz = _TerrainTreeLightColors[2].xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat6 = dot(in_NORMAL0.xyz, _TerrainTreeLightDirections[3].xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = u_xlat1.x * u_xlat6;
    u_xlat0.xyz = _TerrainTreeLightColors[3].xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * _TreeInstanceColor.xyz;
    vs_TEXCOORD1.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz;
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
; Bound: 338
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %186 %196 %197 %209 %222 %321 
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
                                                      OpDecorate %209 Location 209 
                                                      OpDecorate %222 Location 222 
                                                      OpDecorate vs_TEXCOORD1 Location 321 
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
                                              %22 = OpTypeStruct %17 %7 %18 %7 %7 %19 %7 %6 %6 %6 %7 %20 %21 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4; f32_4[4]; f32_4; f32_4; f32_4[4]; f32_4; f32; f32; f32; f32_4; f32_3[4]; f32_4[4];}* %24 = OpVariable Uniform 
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
                                             %208 = OpTypePointer Input %12 
                                Input f32_3* %209 = OpVariable Input 
                                         i32 %211 = OpConstant 11 
                                             %212 = OpTypePointer Uniform %12 
                                         f32 %217 = OpConstant 3.674022E-40 
                                         i32 %219 = OpConstant 8 
                                Input f32_4* %222 = OpVariable Input 
                                             %223 = OpTypePointer Input %6 
                                         i32 %227 = OpConstant 9 
                                         u32 %231 = OpConstant 0 
                                         i32 %237 = OpConstant 12 
                                         i32 %314 = OpConstant 10 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         f32 %330 = OpConstant 3.674022E-40 
                                             %331 = OpTypePointer Output %6 
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
                              Uniform f32_4* %199 = OpAccessChain %24 %38 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %202 = OpAccessChain %24 %38 
                                       f32_4 %203 = OpLoad %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFAdd %201 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %9 %207 
                                       f32_3 %210 = OpLoad %209 
                              Uniform f32_3* %213 = OpAccessChain %24 %211 %45 
                                       f32_3 %214 = OpLoad %213 
                                         f32 %215 = OpDot %210 %214 
                                                      OpStore %93 %215 
                                         f32 %216 = OpLoad %93 
                                         f32 %218 = OpExtInst %1 40 %216 %217 
                                                      OpStore %93 %218 
                                Uniform f32* %220 = OpAccessChain %24 %219 
                                         f32 %221 = OpLoad %220 
                                  Input f32* %224 = OpAccessChain %222 %102 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFMul %221 %225 
                                Uniform f32* %228 = OpAccessChain %24 %227 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFAdd %226 %229 
                                Private f32* %232 = OpAccessChain %34 %231 
                                                      OpStore %232 %230 
                                         f32 %233 = OpLoad %93 
                                Private f32* %234 = OpAccessChain %34 %231 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %233 %235 
                                                      OpStore %93 %236 
                              Uniform f32_4* %238 = OpAccessChain %24 %237 %45 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                         f32 %241 = OpLoad %93 
                                       f32_3 %242 = OpCompositeConstruct %241 %241 %241 
                                       f32_3 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %9 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpFAdd %243 %245 
                                       f32_4 %247 = OpLoad %9 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %9 %248 
                                       f32_3 %249 = OpLoad %209 
                              Uniform f32_3* %250 = OpAccessChain %24 %211 %38 
                                       f32_3 %251 = OpLoad %250 
                                         f32 %252 = OpDot %249 %251 
                                                      OpStore %93 %252 
                                         f32 %253 = OpLoad %93 
                                         f32 %254 = OpExtInst %1 40 %253 %217 
                                                      OpStore %93 %254 
                                Private f32* %255 = OpAccessChain %34 %231 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpLoad %93 
                                         f32 %258 = OpFMul %256 %257 
                                                      OpStore %93 %258 
                              Uniform f32_4* %259 = OpAccessChain %24 %237 %38 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                         f32 %262 = OpLoad %93 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpFMul %261 %263 
                                       f32_4 %265 = OpLoad %9 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFAdd %264 %266 
                                       f32_4 %268 = OpLoad %9 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %9 %269 
                                       f32_3 %270 = OpLoad %209 
                              Uniform f32_3* %271 = OpAccessChain %24 %211 %57 
                                       f32_3 %272 = OpLoad %271 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %93 %273 
                                         f32 %274 = OpLoad %93 
                                         f32 %275 = OpExtInst %1 40 %274 %217 
                                                      OpStore %93 %275 
                                Private f32* %276 = OpAccessChain %34 %231 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpLoad %93 
                                         f32 %279 = OpFMul %277 %278 
                                                      OpStore %93 %279 
                              Uniform f32_4* %280 = OpAccessChain %24 %237 %57 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                         f32 %283 = OpLoad %93 
                                       f32_3 %284 = OpCompositeConstruct %283 %283 %283 
                                       f32_3 %285 = OpFMul %282 %284 
                                       f32_4 %286 = OpLoad %9 
                                       f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                       f32_3 %288 = OpFAdd %285 %287 
                                       f32_4 %289 = OpLoad %9 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %9 %290 
                                       f32_3 %291 = OpLoad %209 
                              Uniform f32_3* %292 = OpAccessChain %24 %211 %159 
                                       f32_3 %293 = OpLoad %292 
                                         f32 %294 = OpDot %291 %293 
                                                      OpStore %93 %294 
                                         f32 %295 = OpLoad %93 
                                         f32 %296 = OpExtInst %1 40 %295 %217 
                                                      OpStore %93 %296 
                                Private f32* %297 = OpAccessChain %34 %231 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpLoad %93 
                                         f32 %300 = OpFMul %298 %299 
                                                      OpStore %93 %300 
                              Uniform f32_4* %301 = OpAccessChain %24 %237 %159 
                                       f32_4 %302 = OpLoad %301 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                         f32 %304 = OpLoad %93 
                                       f32_3 %305 = OpCompositeConstruct %304 %304 %304 
                                       f32_3 %306 = OpFMul %303 %305 
                                       f32_4 %307 = OpLoad %9 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %309 = OpFAdd %306 %308 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 6 3 
                                                      OpStore %9 %311 
                                       f32_4 %312 = OpLoad %9 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                              Uniform f32_4* %315 = OpAccessChain %24 %314 
                                       f32_4 %316 = OpLoad %315 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFMul %313 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_4 %322 = OpLoad %9 
                                       f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
                              Uniform f32_4* %324 = OpAccessChain %24 %159 
                                       f32_4 %325 = OpLoad %324 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFMul %323 %326 
                                       f32_4 %328 = OpLoad vs_TEXCOORD1 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %329 
                                 Output f32* %332 = OpAccessChain vs_TEXCOORD1 %102 
                                                      OpStore %332 %330 
                                 Output f32* %333 = OpAccessChain %186 %45 %182 
                                         f32 %334 = OpLoad %333 
                                         f32 %335 = OpFNegate %334 
                                 Output f32* %336 = OpAccessChain %186 %45 %182 
                                                      OpStore %336 %335 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 43
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %31 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpDecorate vs_TEXCOORD1 Location 31 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 4 
                                     %21 = OpTypePointer Input %20 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 2 
                                     %28 = OpTypePointer Output %20 
                       Output f32_4* %29 = OpVariable Output 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %37 = OpConstant 3.674022E-40 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 3 
                                     %40 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %24 = OpLoad vs_TEXCOORD0 
                               f32_2 %25 = OpVectorShuffle %24 %24 0 1 
                               f32_4 %26 = OpImageSampleImplicitLod %19 %25 
                               f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                             OpStore %9 %27 
                               f32_3 %30 = OpLoad %9 
                               f32_4 %32 = OpLoad vs_TEXCOORD1 
                               f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                               f32_3 %34 = OpFMul %30 %33 
                               f32_4 %35 = OpLoad %29 
                               f32_4 %36 = OpVectorShuffle %35 %34 4 5 6 3 
                                             OpStore %29 %36 
                         Output f32* %41 = OpAccessChain %29 %39 
                                             OpStore %41 %37 
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