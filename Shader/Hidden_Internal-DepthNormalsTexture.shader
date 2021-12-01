//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DepthNormalsTexture" {
Properties {
_MainTex ("", 2D) = "white" { }
_Cutoff ("", Float) = 0.5
_Color ("", Color) = (1,1,1,1)
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 25696
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD0.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 309
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %76 %129 %185 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %74 0 BuiltIn 74 
                                                      OpMemberDecorate %74 1 BuiltIn 74 
                                                      OpMemberDecorate %74 2 BuiltIn 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 129 
                                                      OpDecorate %185 Location 185 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeStruct %7 %16 %17 %18 %19 %20 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4];}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %30 = OpConstant 0 
                                          i32 %38 = OpConstant 2 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %51 = OpVariable Private 
                                          i32 %54 = OpConstant 5 
                                          u32 %72 = OpConstant 1 
                                              %73 = OpTypeArray %6 %72 
                                              %74 = OpTypeStruct %7 %6 %73 
                                              %75 = OpTypePointer Output %74 
         Output struct {f32_4; f32; f32[1];}* %76 = OpVariable Output 
                                              %84 = OpTypePointer Output %7 
                                              %86 = OpTypePointer Private %6 
                                 Private f32* %87 = OpVariable Private 
                                          u32 %90 = OpConstant 2 
                                              %91 = OpTypePointer Uniform %6 
                                          u32 %97 = OpConstant 0 
                                         u32 %115 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %133 = OpTypePointer Output %6 
                                             %135 = OpTypeVector %6 3 
                                         i32 %139 = OpConstant 4 
                                             %184 = OpTypePointer Input %135 
                                Input f32_3* %185 = OpVariable Input 
                                Private f32* %289 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %23 %25 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %31 = OpAccessChain %23 %25 %30 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %39 = OpAccessChain %23 %25 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %11 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 2 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                                        f32_4 %46 = OpLoad %9 
                               Uniform f32_4* %48 = OpAccessChain %23 %25 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpFAdd %46 %49 
                                                      OpStore %9 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %52 1 1 1 1 
                               Uniform f32_4* %55 = OpAccessChain %23 %54 %25 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFMul %53 %56 
                                                      OpStore %51 %57 
                               Uniform f32_4* %58 = OpAccessChain %23 %54 %30 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %60 0 0 0 0 
                                        f32_4 %62 = OpFMul %59 %61 
                                        f32_4 %63 = OpLoad %51 
                                        f32_4 %64 = OpFAdd %62 %63 
                                                      OpStore %51 %64 
                               Uniform f32_4* %65 = OpAccessChain %23 %54 %38 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %67 2 2 2 2 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %51 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %51 %71 
                               Uniform f32_4* %77 = OpAccessChain %23 %54 %47 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %79 3 3 3 3 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %51 
                                        f32_4 %83 = OpFAdd %81 %82 
                                Output f32_4* %85 = OpAccessChain %76 %30 
                                                      OpStore %85 %83 
                                 Private f32* %88 = OpAccessChain %9 %72 
                                          f32 %89 = OpLoad %88 
                                 Uniform f32* %92 = OpAccessChain %23 %47 %25 %90 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFMul %89 %93 
                                                      OpStore %87 %94 
                                 Uniform f32* %95 = OpAccessChain %23 %47 %30 %90 
                                          f32 %96 = OpLoad %95 
                                 Private f32* %98 = OpAccessChain %9 %97 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %96 %99 
                                         f32 %101 = OpLoad %87 
                                         f32 %102 = OpFAdd %100 %101 
                                Private f32* %103 = OpAccessChain %9 %97 
                                                      OpStore %103 %102 
                                Uniform f32* %104 = OpAccessChain %23 %47 %38 %90 
                                         f32 %105 = OpLoad %104 
                                Private f32* %106 = OpAccessChain %9 %90 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFMul %105 %107 
                                Private f32* %109 = OpAccessChain %9 %97 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFAdd %108 %110 
                                Private f32* %112 = OpAccessChain %9 %97 
                                                      OpStore %112 %111 
                                Uniform f32* %113 = OpAccessChain %23 %47 %47 %90 
                                         f32 %114 = OpLoad %113 
                                Private f32* %116 = OpAccessChain %9 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFMul %114 %117 
                                Private f32* %119 = OpAccessChain %9 %97 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFAdd %118 %120 
                                Private f32* %122 = OpAccessChain %9 %97 
                                                      OpStore %122 %121 
                                Private f32* %123 = OpAccessChain %9 %97 
                                         f32 %124 = OpLoad %123 
                                Uniform f32* %125 = OpAccessChain %23 %30 %115 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %124 %126 
                                Private f32* %128 = OpAccessChain %9 %97 
                                                      OpStore %128 %127 
                                Private f32* %130 = OpAccessChain %9 %97 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpFNegate %131 
                                 Output f32* %134 = OpAccessChain vs_TEXCOORD0 %115 
                                                      OpStore %134 %132 
                              Uniform f32_4* %136 = OpAccessChain %23 %38 %25 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                              Uniform f32_4* %140 = OpAccessChain %23 %139 %30 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 1 1 1 
                                       f32_3 %143 = OpFMul %138 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %9 %145 
                              Uniform f32_4* %146 = OpAccessChain %23 %38 %30 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                              Uniform f32_4* %149 = OpAccessChain %23 %139 %30 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 0 0 
                                       f32_3 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFAdd %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %9 %157 
                              Uniform f32_4* %158 = OpAccessChain %23 %38 %38 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                              Uniform f32_4* %161 = OpAccessChain %23 %139 %30 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 2 2 2 
                                       f32_3 %164 = OpFMul %160 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFAdd %164 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                              Uniform f32_4* %170 = OpAccessChain %23 %38 %47 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %23 %139 %30 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 3 3 3 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %176 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %9 %181 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %186 = OpLoad %185 
                                         f32 %187 = OpDot %183 %186 
                                Private f32* %188 = OpAccessChain %9 %97 
                                                      OpStore %188 %187 
                              Uniform f32_4* %189 = OpAccessChain %23 %38 %25 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                              Uniform f32_4* %192 = OpAccessChain %23 %139 %25 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 1 1 1 
                                       f32_3 %195 = OpFMul %191 %194 
                                       f32_4 %196 = OpLoad %51 
                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                      OpStore %51 %197 
                              Uniform f32_4* %198 = OpAccessChain %23 %38 %30 
                                       f32_4 %199 = OpLoad %198 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %23 %139 %25 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 0 0 
                                       f32_3 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad %51 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
                                       f32_3 %207 = OpFAdd %204 %206 
                                       f32_4 %208 = OpLoad %51 
                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
                                                      OpStore %51 %209 
                              Uniform f32_4* %210 = OpAccessChain %23 %38 %38 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                              Uniform f32_4* %213 = OpAccessChain %23 %139 %25 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 2 2 2 
                                       f32_3 %216 = OpFMul %212 %215 
                                       f32_4 %217 = OpLoad %51 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %51 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %51 %221 
                              Uniform f32_4* %222 = OpAccessChain %23 %38 %47 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                              Uniform f32_4* %225 = OpAccessChain %23 %139 %25 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 3 3 3 
                                       f32_3 %228 = OpFMul %224 %227 
                                       f32_4 %229 = OpLoad %51 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                       f32_3 %231 = OpFAdd %228 %230 
                                       f32_4 %232 = OpLoad %51 
                                       f32_4 %233 = OpVectorShuffle %232 %231 4 5 6 3 
                                                      OpStore %51 %233 
                                       f32_4 %234 = OpLoad %51 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpLoad %185 
                                         f32 %237 = OpDot %235 %236 
                                Private f32* %238 = OpAccessChain %9 %72 
                                                      OpStore %238 %237 
                              Uniform f32_4* %239 = OpAccessChain %23 %38 %25 
                                       f32_4 %240 = OpLoad %239 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                              Uniform f32_4* %242 = OpAccessChain %23 %139 %38 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 1 1 1 
                                       f32_3 %245 = OpFMul %241 %244 
                                       f32_4 %246 = OpLoad %51 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %51 %247 
                              Uniform f32_4* %248 = OpAccessChain %23 %38 %30 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                              Uniform f32_4* %251 = OpAccessChain %23 %139 %38 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 0 0 
                                       f32_3 %254 = OpFMul %250 %253 
                                       f32_4 %255 = OpLoad %51 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFAdd %254 %256 
                                       f32_4 %258 = OpLoad %51 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %51 %259 
                              Uniform f32_4* %260 = OpAccessChain %23 %38 %38 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %23 %139 %38 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 2 2 2 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_4 %267 = OpLoad %51 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_3 %269 = OpFAdd %266 %268 
                                       f32_4 %270 = OpLoad %51 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %51 %271 
                              Uniform f32_4* %272 = OpAccessChain %23 %38 %47 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                              Uniform f32_4* %275 = OpAccessChain %23 %139 %38 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 3 3 3 
                                       f32_3 %278 = OpFMul %274 %277 
                                       f32_4 %279 = OpLoad %51 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpFAdd %278 %280 
                                       f32_4 %282 = OpLoad %51 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %51 %283 
                                       f32_4 %284 = OpLoad %51 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %286 = OpLoad %185 
                                         f32 %287 = OpDot %285 %286 
                                Private f32* %288 = OpAccessChain %9 %90 
                                                      OpStore %288 %287 
                                       f32_4 %290 = OpLoad %9 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                                       f32_4 %292 = OpLoad %9 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                         f32 %294 = OpDot %291 %293 
                                                      OpStore %289 %294 
                                         f32 %295 = OpLoad %289 
                                         f32 %296 = OpExtInst %1 32 %295 
                                                      OpStore %289 %296 
                                         f32 %297 = OpLoad %289 
                                       f32_3 %298 = OpCompositeConstruct %297 %297 %297 
                                       f32_4 %299 = OpLoad %9 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpFMul %298 %300 
                                       f32_4 %302 = OpLoad vs_TEXCOORD0 
                                       f32_4 %303 = OpVectorShuffle %302 %301 4 5 6 3 
                                                      OpStore vs_TEXCOORD0 %303 
                                 Output f32* %304 = OpAccessChain %76 %30 %72 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFNegate %305 
                                 Output f32* %307 = OpAccessChain %76 %30 %72 
                                                      OpStore %307 %306 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 62
; Schema: 0
                              OpCapability Shader 
                       %1 = OpExtInstImport "GLSL.std.450" 
                              OpMemoryModel Logical GLSL450 
                              OpEntryPoint Fragment %4 "main" %12 %29 
                              OpExecutionMode %4 OriginUpperLeft 
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate vs_TEXCOORD0 Location 12 
                              OpDecorate %29 Location 29 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 2 
                       %8 = OpTypePointer Private %7 
        Private f32_2* %9 = OpVariable Private 
                      %10 = OpTypeVector %6 4 
                      %11 = OpTypePointer Input %10 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                      %13 = OpTypeInt 32 0 
                  u32 %14 = OpConstant 2 
                      %15 = OpTypePointer Input %6 
                  f32 %18 = OpConstant 3.674022E-40 
                  u32 %20 = OpConstant 0 
                      %21 = OpTypePointer Private %6 
                      %28 = OpTypePointer Output %10 
        Output f32_4* %29 = OpVariable Output 
                  f32 %31 = OpConstant 3.674022E-40 
                f32_2 %32 = OpConstantComposite %31 %31 
                  f32 %34 = OpConstant 3.674022E-40 
                f32_2 %35 = OpConstantComposite %34 %34 
                  f32 %41 = OpConstant 3.674022E-40 
                f32_2 %42 = OpConstantComposite %18 %41 
                  u32 %46 = OpConstant 1 
                  f32 %50 = OpConstant 3.674022E-40 
                      %55 = OpTypePointer Output %6 
                  u32 %59 = OpConstant 3 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
           Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                  f32 %17 = OpLoad %16 
                  f32 %19 = OpFAdd %17 %18 
         Private f32* %22 = OpAccessChain %9 %20 
                              OpStore %22 %19 
                f32_4 %23 = OpLoad vs_TEXCOORD0 
                f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                f32_2 %25 = OpLoad %9 
                f32_2 %26 = OpVectorShuffle %25 %25 0 0 
                f32_2 %27 = OpFDiv %24 %26 
                              OpStore %9 %27 
                f32_2 %30 = OpLoad %9 
                f32_2 %33 = OpFMul %30 %32 
                f32_2 %36 = OpFAdd %33 %35 
                f32_4 %37 = OpLoad %29 
                f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                              OpStore %29 %38 
                f32_4 %39 = OpLoad vs_TEXCOORD0 
                f32_2 %40 = OpVectorShuffle %39 %39 3 3 
                f32_2 %43 = OpFMul %40 %42 
                              OpStore %9 %43 
                f32_2 %44 = OpLoad %9 
                f32_2 %45 = OpExtInst %1 10 %44 
                              OpStore %9 %45 
         Private f32* %47 = OpAccessChain %9 %46 
                  f32 %48 = OpLoad %47 
                  f32 %49 = OpFNegate %48 
                  f32 %51 = OpFMul %49 %50 
         Private f32* %52 = OpAccessChain %9 %20 
                  f32 %53 = OpLoad %52 
                  f32 %54 = OpFAdd %51 %53 
          Output f32* %56 = OpAccessChain %29 %14 
                              OpStore %56 %54 
         Private f32* %57 = OpAccessChain %9 %46 
                  f32 %58 = OpLoad %57 
          Output f32* %60 = OpAccessChain %29 %59 
                              OpStore %60 %58 
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
SubShader {
 Tags { "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "RenderType" = "TransparentCutout" }
  GpuProgramID 115287
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w * _Color.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 324
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %76 %88 %89 %144 %200 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %74 0 BuiltIn 74 
                                                      OpMemberDecorate %74 1 BuiltIn 74 
                                                      OpMemberDecorate %74 2 BuiltIn 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 88 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate vs_TEXCOORD1 Location 144 
                                                      OpDecorate %200 Location 200 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeStruct %7 %16 %17 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %30 = OpConstant 0 
                                          i32 %38 = OpConstant 2 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %51 = OpVariable Private 
                                          i32 %54 = OpConstant 5 
                                          u32 %72 = OpConstant 1 
                                              %73 = OpTypeArray %6 %72 
                                              %74 = OpTypeStruct %7 %6 %73 
                                              %75 = OpTypePointer Output %74 
         Output struct {f32_4; f32; f32[1];}* %76 = OpVariable Output 
                                              %84 = OpTypePointer Output %7 
                                              %86 = OpTypeVector %6 2 
                                              %87 = OpTypePointer Output %86 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                 Input f32_4* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 6 
                                             %101 = OpTypePointer Private %6 
                                Private f32* %102 = OpVariable Private 
                                         u32 %105 = OpConstant 2 
                                             %106 = OpTypePointer Uniform %6 
                                         u32 %112 = OpConstant 0 
                                         u32 %130 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %148 = OpTypePointer Output %6 
                                             %150 = OpTypeVector %6 3 
                                         i32 %154 = OpConstant 4 
                                             %199 = OpTypePointer Input %150 
                                Input f32_3* %200 = OpVariable Input 
                                Private f32* %304 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %23 %25 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %31 = OpAccessChain %23 %25 %30 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %39 = OpAccessChain %23 %25 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %11 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 2 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                                        f32_4 %46 = OpLoad %9 
                               Uniform f32_4* %48 = OpAccessChain %23 %25 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpFAdd %46 %49 
                                                      OpStore %9 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %52 1 1 1 1 
                               Uniform f32_4* %55 = OpAccessChain %23 %54 %25 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFMul %53 %56 
                                                      OpStore %51 %57 
                               Uniform f32_4* %58 = OpAccessChain %23 %54 %30 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %60 0 0 0 0 
                                        f32_4 %62 = OpFMul %59 %61 
                                        f32_4 %63 = OpLoad %51 
                                        f32_4 %64 = OpFAdd %62 %63 
                                                      OpStore %51 %64 
                               Uniform f32_4* %65 = OpAccessChain %23 %54 %38 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %67 2 2 2 2 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %51 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %51 %71 
                               Uniform f32_4* %77 = OpAccessChain %23 %54 %47 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %79 3 3 3 3 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %51 
                                        f32_4 %83 = OpFAdd %81 %82 
                                Output f32_4* %85 = OpAccessChain %76 %30 
                                                      OpStore %85 %83 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                               Uniform f32_4* %93 = OpAccessChain %23 %92 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %91 %95 
                               Uniform f32_4* %97 = OpAccessChain %23 %92 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                                      OpStore vs_TEXCOORD0 %100 
                                Private f32* %103 = OpAccessChain %9 %72 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %107 = OpAccessChain %23 %47 %25 %105 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFMul %104 %108 
                                                      OpStore %102 %109 
                                Uniform f32* %110 = OpAccessChain %23 %47 %30 %105 
                                         f32 %111 = OpLoad %110 
                                Private f32* %113 = OpAccessChain %9 %112 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %111 %114 
                                         f32 %116 = OpLoad %102 
                                         f32 %117 = OpFAdd %115 %116 
                                Private f32* %118 = OpAccessChain %9 %112 
                                                      OpStore %118 %117 
                                Uniform f32* %119 = OpAccessChain %23 %47 %38 %105 
                                         f32 %120 = OpLoad %119 
                                Private f32* %121 = OpAccessChain %9 %105 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFMul %120 %122 
                                Private f32* %124 = OpAccessChain %9 %112 
                                         f32 %125 = OpLoad %124 
                                         f32 %126 = OpFAdd %123 %125 
                                Private f32* %127 = OpAccessChain %9 %112 
                                                      OpStore %127 %126 
                                Uniform f32* %128 = OpAccessChain %23 %47 %47 %105 
                                         f32 %129 = OpLoad %128 
                                Private f32* %131 = OpAccessChain %9 %130 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFMul %129 %132 
                                Private f32* %134 = OpAccessChain %9 %112 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFAdd %133 %135 
                                Private f32* %137 = OpAccessChain %9 %112 
                                                      OpStore %137 %136 
                                Private f32* %138 = OpAccessChain %9 %112 
                                         f32 %139 = OpLoad %138 
                                Uniform f32* %140 = OpAccessChain %23 %30 %130 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFMul %139 %141 
                                Private f32* %143 = OpAccessChain %9 %112 
                                                      OpStore %143 %142 
                                Private f32* %145 = OpAccessChain %9 %112 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFNegate %146 
                                 Output f32* %149 = OpAccessChain vs_TEXCOORD1 %130 
                                                      OpStore %149 %147 
                              Uniform f32_4* %151 = OpAccessChain %23 %38 %25 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %155 = OpAccessChain %23 %154 %30 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 1 1 1 
                                       f32_3 %158 = OpFMul %153 %157 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                      OpStore %9 %160 
                              Uniform f32_4* %161 = OpAccessChain %23 %38 %30 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                              Uniform f32_4* %164 = OpAccessChain %23 %154 %30 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 0 0 
                                       f32_3 %167 = OpFMul %163 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %167 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                      OpStore %9 %172 
                              Uniform f32_4* %173 = OpAccessChain %23 %38 %38 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_4* %176 = OpAccessChain %23 %154 %30 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 2 2 2 
                                       f32_3 %179 = OpFMul %175 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %179 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %9 %184 
                              Uniform f32_4* %185 = OpAccessChain %23 %38 %47 
                                       f32_4 %186 = OpLoad %185 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %23 %154 %30 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 3 3 3 
                                       f32_3 %191 = OpFMul %187 %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %9 %196 
                                       f32_4 %197 = OpLoad %9 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %201 = OpLoad %200 
                                         f32 %202 = OpDot %198 %201 
                                Private f32* %203 = OpAccessChain %9 %112 
                                                      OpStore %203 %202 
                              Uniform f32_4* %204 = OpAccessChain %23 %38 %25 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
                              Uniform f32_4* %207 = OpAccessChain %23 %154 %25 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 1 1 1 
                                       f32_3 %210 = OpFMul %206 %209 
                                       f32_4 %211 = OpLoad %51 
                                       f32_4 %212 = OpVectorShuffle %211 %210 4 5 6 3 
                                                      OpStore %51 %212 
                              Uniform f32_4* %213 = OpAccessChain %23 %38 %30 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                              Uniform f32_4* %216 = OpAccessChain %23 %154 %25 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 0 0 
                                       f32_3 %219 = OpFMul %215 %218 
                                       f32_4 %220 = OpLoad %51 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpFAdd %219 %221 
                                       f32_4 %223 = OpLoad %51 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 6 3 
                                                      OpStore %51 %224 
                              Uniform f32_4* %225 = OpAccessChain %23 %38 %38 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %23 %154 %25 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 2 2 2 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_4 %232 = OpLoad %51 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                       f32_3 %234 = OpFAdd %231 %233 
                                       f32_4 %235 = OpLoad %51 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %51 %236 
                              Uniform f32_4* %237 = OpAccessChain %23 %38 %47 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                              Uniform f32_4* %240 = OpAccessChain %23 %154 %25 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 3 3 3 
                                       f32_3 %243 = OpFMul %239 %242 
                                       f32_4 %244 = OpLoad %51 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpFAdd %243 %245 
                                       f32_4 %247 = OpLoad %51 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %51 %248 
                                       f32_4 %249 = OpLoad %51 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpLoad %200 
                                         f32 %252 = OpDot %250 %251 
                                Private f32* %253 = OpAccessChain %9 %72 
                                                      OpStore %253 %252 
                              Uniform f32_4* %254 = OpAccessChain %23 %38 %25 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                              Uniform f32_4* %257 = OpAccessChain %23 %154 %38 
                                       f32_4 %258 = OpLoad %257 
                                       f32_3 %259 = OpVectorShuffle %258 %258 1 1 1 
                                       f32_3 %260 = OpFMul %256 %259 
                                       f32_4 %261 = OpLoad %51 
                                       f32_4 %262 = OpVectorShuffle %261 %260 4 5 6 3 
                                                      OpStore %51 %262 
                              Uniform f32_4* %263 = OpAccessChain %23 %38 %30 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                              Uniform f32_4* %266 = OpAccessChain %23 %154 %38 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 0 0 
                                       f32_3 %269 = OpFMul %265 %268 
                                       f32_4 %270 = OpLoad %51 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %51 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %51 %274 
                              Uniform f32_4* %275 = OpAccessChain %23 %38 %38 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %23 %154 %38 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 2 2 2 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_4 %282 = OpLoad %51 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFAdd %281 %283 
                                       f32_4 %285 = OpLoad %51 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %51 %286 
                              Uniform f32_4* %287 = OpAccessChain %23 %38 %47 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                              Uniform f32_4* %290 = OpAccessChain %23 %154 %38 
                                       f32_4 %291 = OpLoad %290 
                                       f32_3 %292 = OpVectorShuffle %291 %291 3 3 3 
                                       f32_3 %293 = OpFMul %289 %292 
                                       f32_4 %294 = OpLoad %51 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                                       f32_3 %296 = OpFAdd %293 %295 
                                       f32_4 %297 = OpLoad %51 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                                      OpStore %51 %298 
                                       f32_4 %299 = OpLoad %51 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpLoad %200 
                                         f32 %302 = OpDot %300 %301 
                                Private f32* %303 = OpAccessChain %9 %105 
                                                      OpStore %303 %302 
                                       f32_4 %305 = OpLoad %9 
                                       f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                                       f32_4 %307 = OpLoad %9 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                         f32 %309 = OpDot %306 %308 
                                                      OpStore %304 %309 
                                         f32 %310 = OpLoad %304 
                                         f32 %311 = OpExtInst %1 32 %310 
                                                      OpStore %304 %311 
                                         f32 %312 = OpLoad %304 
                                       f32_3 %313 = OpCompositeConstruct %312 %312 %312 
                                       f32_4 %314 = OpLoad %9 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFMul %313 %315 
                                       f32_4 %317 = OpLoad vs_TEXCOORD1 
                                       f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %318 
                                 Output f32* %319 = OpAccessChain %76 %30 %72 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpFNegate %320 
                                 Output f32* %322 = OpAccessChain %76 %30 %72 
                                                      OpStore %322 %321 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %64 %78 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpMemberDecorate %33 1 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate vs_TEXCOORD1 Location 64 
                                             OpDecorate %78 Location 78 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypeStruct %6 %23 
                                     %34 = OpTypePointer Uniform %33 
       Uniform struct {f32; f32_4;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 1 
                                     %38 = OpTypePointer Uniform %6 
                                 i32 %42 = OpConstant 0 
                                     %48 = OpTypeBool 
                                     %49 = OpTypePointer Private %48 
                       Private bool* %50 = OpVariable Private 
                                 f32 %53 = OpConstant 3.674022E-40 
                                 i32 %57 = OpConstant -1 
                                     %63 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 u32 %65 = OpConstant 2 
                                     %66 = OpTypePointer Input %6 
                                 f32 %69 = OpConstant 3.674022E-40 
                                     %77 = OpTypePointer Output %23 
                       Output f32_4* %78 = OpVariable Output 
                                 f32 %80 = OpConstant 3.674022E-40 
                               f32_2 %81 = OpConstantComposite %80 %80 
                                 f32 %83 = OpConstant 3.674022E-40 
                               f32_2 %84 = OpConstantComposite %83 %83 
                                 f32 %90 = OpConstant 3.674022E-40 
                               f32_2 %91 = OpConstantComposite %69 %90 
                                 u32 %95 = OpConstant 1 
                                 f32 %99 = OpConstant 3.674022E-40 
                                    %104 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 %26 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFMul %32 %40 
                        Uniform f32* %43 = OpAccessChain %35 %42 
                                 f32 %44 = OpLoad %43 
                                 f32 %45 = OpFNegate %44 
                                 f32 %46 = OpFAdd %41 %45 
                        Private f32* %47 = OpAccessChain %9 %28 
                                             OpStore %47 %46 
                        Private f32* %51 = OpAccessChain %9 %28 
                                 f32 %52 = OpLoad %51 
                                bool %54 = OpFOrdLessThan %52 %53 
                                             OpStore %50 %54 
                                bool %55 = OpLoad %50 
                                 i32 %56 = OpSelect %55 %37 %42 
                                 i32 %58 = OpIMul %56 %57 
                                bool %59 = OpINotEqual %58 %42 
                                             OpSelectionMerge %61 None 
                                             OpBranchConditional %59 %60 %61 
                                     %60 = OpLabel 
                                             OpKill
                                     %61 = OpLabel 
                          Input f32* %67 = OpAccessChain vs_TEXCOORD1 %65 
                                 f32 %68 = OpLoad %67 
                                 f32 %70 = OpFAdd %68 %69 
                        Private f32* %71 = OpAccessChain %9 %28 
                                             OpStore %71 %70 
                               f32_4 %72 = OpLoad vs_TEXCOORD1 
                               f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                               f32_2 %74 = OpLoad %9 
                               f32_2 %75 = OpVectorShuffle %74 %74 0 0 
                               f32_2 %76 = OpFDiv %73 %75 
                                             OpStore %9 %76 
                               f32_2 %79 = OpLoad %9 
                               f32_2 %82 = OpFMul %79 %81 
                               f32_2 %85 = OpFAdd %82 %84 
                               f32_4 %86 = OpLoad %78 
                               f32_4 %87 = OpVectorShuffle %86 %85 4 5 2 3 
                                             OpStore %78 %87 
                               f32_4 %88 = OpLoad vs_TEXCOORD1 
                               f32_2 %89 = OpVectorShuffle %88 %88 3 3 
                               f32_2 %92 = OpFMul %89 %91 
                                             OpStore %9 %92 
                               f32_2 %93 = OpLoad %9 
                               f32_2 %94 = OpExtInst %1 10 %93 
                                             OpStore %9 %94 
                        Private f32* %96 = OpAccessChain %9 %95 
                                 f32 %97 = OpLoad %96 
                                 f32 %98 = OpFNegate %97 
                                f32 %100 = OpFMul %98 %99 
                       Private f32* %101 = OpAccessChain %9 %28 
                                f32 %102 = OpLoad %101 
                                f32 %103 = OpFAdd %100 %102 
                        Output f32* %105 = OpAccessChain %78 %65 
                                             OpStore %105 %103 
                       Private f32* %106 = OpAccessChain %9 %95 
                                f32 %107 = OpLoad %106 
                        Output f32* %108 = OpAccessChain %78 %26 
                                             OpStore %108 %107 
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
SubShader {
 Tags { "RenderType" = "TreeBark" }
 Pass {
  Tags { "RenderType" = "TreeBark" }
  GpuProgramID 189644
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
    u_xlat8 = u_xlat0.y + in_COLOR0.y;
    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat8));
    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
    u_xlat4 = in_COLOR0.y * 0.100000001;
    u_xlat3.xz = vec2(u_xlat4) * in_NORMAL0.xz;
    u_xlat0.z = 0.300000012;
    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat12 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * in_NORMAL0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 530
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %37 %51 %132 %154 %287 %298 %299 %340 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %37 Location 37 
                                                      OpDecorate %51 Location 51 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %154 Location 154 
                                                      OpMemberDecorate %285 0 BuiltIn 285 
                                                      OpMemberDecorate %285 1 BuiltIn 285 
                                                      OpMemberDecorate %285 2 BuiltIn 285 
                                                      OpDecorate %285 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 298 
                                                      OpDecorate %299 Location 299 
                                                      OpDecorate vs_TEXCOORD1 Location 340 
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
                                              %16 = OpTypeArray %7 %11 
                                              %17 = OpTypeStruct %7 %7 %12 %13 %14 %15 %16 %7 %7 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 2 
                                          i32 %22 = OpConstant 3 
                                              %23 = OpTypeVector %6 3 
                                              %24 = OpTypePointer Uniform %7 
                                          f32 %28 = OpConstant 3.674022E-40 
                                        f32_3 %29 = OpConstantComposite %28 %28 %28 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                              %36 = OpTypePointer Input %7 
                                 Input f32_4* %37 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          u32 %42 = OpConstant 1 
                                 Private f32* %44 = OpVariable Private 
                               Private f32_4* %50 = OpVariable Private 
                                 Input f32_4* %51 = OpVariable Input 
                                          i32 %54 = OpConstant 7 
                                          i32 %69 = OpConstant 0 
                                          f32 %75 = OpConstant 3.674022E-40 
                                          f32 %76 = OpConstant 3.674022E-40 
                                          f32 %77 = OpConstant 3.674022E-40 
                                          f32 %78 = OpConstant 3.674022E-40 
                                        f32_4 %79 = OpConstantComposite %75 %76 %77 %78 
                                          f32 %84 = OpConstant 3.674022E-40 
                                        f32_4 %85 = OpConstantComposite %84 %84 %84 %84 
                                          f32 %87 = OpConstant 3.674022E-40 
                                        f32_4 %88 = OpConstantComposite %87 %87 %87 %87 
                                          f32 %94 = OpConstant 3.674022E-40 
                                        f32_4 %95 = OpConstantComposite %94 %94 %94 %94 
                               Private f32_4* %97 = OpVariable Private 
                                         f32 %107 = OpConstant 3.674022E-40 
                                       f32_4 %108 = OpConstantComposite %107 %107 %107 %107 
                                             %113 = OpTypeVector %6 2 
                                         i32 %123 = OpConstant 10 
                                Input f32_4* %132 = OpVariable Input 
                                             %138 = OpTypePointer Private %23 
                              Private f32_3* %139 = OpVariable Private 
                                Private f32* %146 = OpVariable Private 
                                         f32 %149 = OpConstant 3.674022E-40 
                                             %153 = OpTypePointer Input %23 
                                Input f32_3* %154 = OpVariable Input 
                                         f32 %160 = OpConstant 3.674022E-40 
                                         u32 %161 = OpConstant 2 
                                Private f32* %194 = OpVariable Private 
                                         i32 %195 = OpConstant 8 
                                         u32 %203 = OpConstant 3 
                                             %204 = OpTypePointer Uniform %6 
                                         i32 %228 = OpConstant 9 
                                         i32 %242 = OpConstant 1 
                                         i32 %266 = OpConstant 6 
                                             %284 = OpTypeArray %6 %42 
                                             %285 = OpTypeStruct %7 %6 %284 
                                             %286 = OpTypePointer Output %285 
        Output struct {f32_4; f32; f32[1];}* %287 = OpVariable Output 
                                             %295 = OpTypePointer Output %7 
                                             %297 = OpTypePointer Output %113 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %299 = OpVariable Input 
                                         i32 %304 = OpConstant 4 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %344 = OpTypePointer Output %6 
                                         i32 %349 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %25 = OpAccessChain %19 %21 %22 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                          f32 %30 = OpDot %27 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                 Private f32* %34 = OpAccessChain %9 %31 
                                          f32 %35 = OpLoad %34 
                                   Input f32* %39 = OpAccessChain %37 %31 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFAdd %35 %40 
                                 Private f32* %43 = OpAccessChain %9 %42 
                                                      OpStore %43 %41 
                                 Private f32* %45 = OpAccessChain %9 %42 
                                          f32 %46 = OpLoad %45 
                                   Input f32* %47 = OpAccessChain %37 %42 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFAdd %46 %48 
                                                      OpStore %44 %49 
                                        f32_4 %52 = OpLoad %51 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %19 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_3 %58 = OpFMul %53 %57 
                                        f32_4 %59 = OpLoad %50 
                                        f32_4 %60 = OpVectorShuffle %59 %58 4 5 6 3 
                                                      OpStore %50 %60 
                                        f32_4 %61 = OpLoad %50 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                          f32 %63 = OpLoad %44 
                                        f32_3 %64 = OpCompositeConstruct %63 %63 %63 
                                          f32 %65 = OpDot %62 %64 
                                 Private f32* %66 = OpAccessChain %9 %31 
                                                      OpStore %66 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 1 1 
                               Uniform f32_4* %70 = OpAccessChain %19 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpVectorShuffle %71 %71 1 1 1 1 
                                        f32_4 %73 = OpFAdd %68 %72 
                                                      OpStore %9 %73 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %80 = OpFMul %74 %79 
                                                      OpStore %9 %80 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpExtInst %1 10 %81 
                                                      OpStore %9 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %89 = OpFAdd %86 %88 
                                                      OpStore %9 %89 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpExtInst %1 10 %90 
                                                      OpStore %9 %91 
                                        f32_4 %92 = OpLoad %9 
                                        f32_4 %93 = OpFMul %92 %85 
                                        f32_4 %96 = OpFAdd %93 %95 
                                                      OpStore %9 %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpExtInst %1 4 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpExtInst %1 4 %100 
                                       f32_4 %102 = OpFMul %99 %101 
                                                      OpStore %97 %102 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpExtInst %1 4 %103 
                                       f32_4 %105 = OpFNegate %104 
                                       f32_4 %106 = OpFMul %105 %85 
                                       f32_4 %109 = OpFAdd %106 %108 
                                                      OpStore %9 %109 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpLoad %97 
                                       f32_4 %112 = OpFMul %110 %111 
                                                      OpStore %9 %112 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 1 3 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 2 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 1 1 1 
                              Uniform f32_4* %124 = OpAccessChain %19 %123 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                       f32_3 %127 = OpFMul %122 %126 
                                       f32_4 %128 = OpLoad %97 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %97 %129 
                                       f32_4 %130 = OpLoad %97 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 1 1 1 
                                       f32_3 %135 = OpFMul %131 %134 
                                       f32_4 %136 = OpLoad %97 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %97 %137 
                                Private f32* %140 = OpAccessChain %9 %42 
                                         f32 %141 = OpLoad %140 
                                  Input f32* %142 = OpAccessChain %132 %42 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFMul %141 %143 
                                Private f32* %145 = OpAccessChain %139 %42 
                                                      OpStore %145 %144 
                                  Input f32* %147 = OpAccessChain %37 %42 
                                         f32 %148 = OpLoad %147 
                                         f32 %150 = OpFMul %148 %149 
                                                      OpStore %146 %150 
                                         f32 %151 = OpLoad %146 
                                       f32_2 %152 = OpCompositeConstruct %151 %151 
                                       f32_3 %155 = OpLoad %154 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 2 
                                       f32_2 %157 = OpFMul %152 %156 
                                       f32_3 %158 = OpLoad %139 
                                       f32_3 %159 = OpVectorShuffle %158 %157 3 1 4 
                                                      OpStore %139 %159 
                                Private f32* %162 = OpAccessChain %9 %161 
                                                      OpStore %162 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 2 0 
                                       f32_3 %165 = OpLoad %139 
                                       f32_3 %166 = OpFMul %164 %165 
                                       f32_4 %167 = OpLoad %97 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %166 %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %9 %171 
                                       f32_4 %172 = OpLoad %9 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                              Uniform f32_4* %174 = OpAccessChain %19 %123 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 3 3 3 
                                       f32_3 %177 = OpFMul %173 %176 
                                       f32_4 %178 = OpLoad %50 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                       f32_3 %180 = OpFAdd %177 %179 
                                       f32_4 %181 = OpLoad %9 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
                                                      OpStore %9 %182 
                                       f32_4 %183 = OpLoad %132 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 0 0 
                              Uniform f32_4* %185 = OpAccessChain %19 %123 
                                       f32_4 %186 = OpLoad %185 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                       f32_3 %188 = OpFMul %184 %187 
                                       f32_4 %189 = OpLoad %9 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFAdd %188 %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %9 %193 
                              Uniform f32_4* %196 = OpAccessChain %19 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_4 %199 = OpLoad %9 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                         f32 %201 = OpDot %198 %200 
                                                      OpStore %194 %201 
                                         f32 %202 = OpLoad %194 
                                Uniform f32* %205 = OpAccessChain %19 %195 %203 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFAdd %202 %206 
                                                      OpStore %194 %207 
                                         f32 %208 = OpLoad %194 
                                       f32_3 %209 = OpCompositeConstruct %208 %208 %208 
                                       f32_3 %210 = OpFNegate %209 
                              Uniform f32_4* %211 = OpAccessChain %19 %195 
                                       f32_4 %212 = OpLoad %211 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
                                       f32_3 %214 = OpFMul %210 %213 
                                       f32_4 %215 = OpLoad %9 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                                       f32_3 %217 = OpFAdd %214 %216 
                                       f32_4 %218 = OpLoad %50 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 6 3 
                                                      OpStore %50 %219 
                                       f32_4 %220 = OpLoad %9 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_4 %222 = OpLoad %50 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpFNegate %223 
                                       f32_3 %225 = OpFAdd %221 %224 
                                       f32_4 %226 = OpLoad %9 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %9 %227 
                                Uniform f32* %229 = OpAccessChain %19 %228 
                                         f32 %230 = OpLoad %229 
                                       f32_3 %231 = OpCompositeConstruct %230 %230 %230 
                                       f32_4 %232 = OpLoad %9 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                       f32_3 %234 = OpFMul %231 %233 
                                       f32_4 %235 = OpLoad %50 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFAdd %234 %236 
                                       f32_4 %238 = OpLoad %9 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %9 %239 
                                       f32_4 %240 = OpLoad %9 
                                       f32_4 %241 = OpVectorShuffle %240 %240 1 1 1 1 
                              Uniform f32_4* %243 = OpAccessChain %19 %21 %242 
                                       f32_4 %244 = OpLoad %243 
                                       f32_4 %245 = OpFMul %241 %244 
                                                      OpStore %50 %245 
                              Uniform f32_4* %246 = OpAccessChain %19 %21 %69 
                                       f32_4 %247 = OpLoad %246 
                                       f32_4 %248 = OpLoad %9 
                                       f32_4 %249 = OpVectorShuffle %248 %248 0 0 0 0 
                                       f32_4 %250 = OpFMul %247 %249 
                                       f32_4 %251 = OpLoad %50 
                                       f32_4 %252 = OpFAdd %250 %251 
                                                      OpStore %50 %252 
                              Uniform f32_4* %253 = OpAccessChain %19 %21 %21 
                                       f32_4 %254 = OpLoad %253 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpVectorShuffle %255 %255 2 2 2 2 
                                       f32_4 %257 = OpFMul %254 %256 
                                       f32_4 %258 = OpLoad %50 
                                       f32_4 %259 = OpFAdd %257 %258 
                                                      OpStore %9 %259 
                                       f32_4 %260 = OpLoad %9 
                              Uniform f32_4* %261 = OpAccessChain %19 %21 %22 
                                       f32_4 %262 = OpLoad %261 
                                       f32_4 %263 = OpFAdd %260 %262 
                                                      OpStore %9 %263 
                                       f32_4 %264 = OpLoad %9 
                                       f32_4 %265 = OpVectorShuffle %264 %264 1 1 1 1 
                              Uniform f32_4* %267 = OpAccessChain %19 %266 %242 
                                       f32_4 %268 = OpLoad %267 
                                       f32_4 %269 = OpFMul %265 %268 
                                                      OpStore %50 %269 
                              Uniform f32_4* %270 = OpAccessChain %19 %266 %69 
                                       f32_4 %271 = OpLoad %270 
                                       f32_4 %272 = OpLoad %9 
                                       f32_4 %273 = OpVectorShuffle %272 %272 0 0 0 0 
                                       f32_4 %274 = OpFMul %271 %273 
                                       f32_4 %275 = OpLoad %50 
                                       f32_4 %276 = OpFAdd %274 %275 
                                                      OpStore %50 %276 
                              Uniform f32_4* %277 = OpAccessChain %19 %266 %21 
                                       f32_4 %278 = OpLoad %277 
                                       f32_4 %279 = OpLoad %9 
                                       f32_4 %280 = OpVectorShuffle %279 %279 2 2 2 2 
                                       f32_4 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %50 
                                       f32_4 %283 = OpFAdd %281 %282 
                                                      OpStore %50 %283 
                              Uniform f32_4* %288 = OpAccessChain %19 %266 %22 
                                       f32_4 %289 = OpLoad %288 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpVectorShuffle %290 %290 3 3 3 3 
                                       f32_4 %292 = OpFMul %289 %291 
                                       f32_4 %293 = OpLoad %50 
                                       f32_4 %294 = OpFAdd %292 %293 
                               Output f32_4* %296 = OpAccessChain %287 %69 
                                                      OpStore %296 %294 
                                       f32_4 %300 = OpLoad %299 
                                       f32_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore vs_TEXCOORD0 %301 
                                Private f32* %302 = OpAccessChain %9 %42 
                                         f32 %303 = OpLoad %302 
                                Uniform f32* %305 = OpAccessChain %19 %304 %242 %161 
                                         f32 %306 = OpLoad %305 
                                         f32 %307 = OpFMul %303 %306 
                                                      OpStore %146 %307 
                                Uniform f32* %308 = OpAccessChain %19 %304 %69 %161 
                                         f32 %309 = OpLoad %308 
                                Private f32* %310 = OpAccessChain %9 %31 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFMul %309 %311 
                                         f32 %313 = OpLoad %146 
                                         f32 %314 = OpFAdd %312 %313 
                                Private f32* %315 = OpAccessChain %9 %31 
                                                      OpStore %315 %314 
                                Uniform f32* %316 = OpAccessChain %19 %304 %21 %161 
                                         f32 %317 = OpLoad %316 
                                Private f32* %318 = OpAccessChain %9 %161 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpFMul %317 %319 
                                Private f32* %321 = OpAccessChain %9 %31 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFAdd %320 %322 
                                Private f32* %324 = OpAccessChain %9 %31 
                                                      OpStore %324 %323 
                                Uniform f32* %325 = OpAccessChain %19 %304 %22 %161 
                                         f32 %326 = OpLoad %325 
                                Private f32* %327 = OpAccessChain %9 %203 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFMul %326 %328 
                                Private f32* %330 = OpAccessChain %9 %31 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFAdd %329 %331 
                                Private f32* %333 = OpAccessChain %9 %31 
                                                      OpStore %333 %332 
                                Private f32* %334 = OpAccessChain %9 %31 
                                         f32 %335 = OpLoad %334 
                                Uniform f32* %336 = OpAccessChain %19 %242 %203 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpFMul %335 %337 
                                Private f32* %339 = OpAccessChain %9 %31 
                                                      OpStore %339 %338 
                                Private f32* %341 = OpAccessChain %9 %31 
                                         f32 %342 = OpLoad %341 
                                         f32 %343 = OpFNegate %342 
                                 Output f32* %345 = OpAccessChain vs_TEXCOORD1 %203 
                                                      OpStore %345 %343 
                              Uniform f32_4* %346 = OpAccessChain %19 %22 %242 
                                       f32_4 %347 = OpLoad %346 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                              Uniform f32_4* %350 = OpAccessChain %19 %349 %69 
                                       f32_4 %351 = OpLoad %350 
                                       f32_3 %352 = OpVectorShuffle %351 %351 1 1 1 
                                       f32_3 %353 = OpFMul %348 %352 
                                       f32_4 %354 = OpLoad %9 
                                       f32_4 %355 = OpVectorShuffle %354 %353 4 5 6 3 
                                                      OpStore %9 %355 
                              Uniform f32_4* %356 = OpAccessChain %19 %22 %69 
                                       f32_4 %357 = OpLoad %356 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
                              Uniform f32_4* %359 = OpAccessChain %19 %349 %69 
                                       f32_4 %360 = OpLoad %359 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 0 0 
                                       f32_3 %362 = OpFMul %358 %361 
                                       f32_4 %363 = OpLoad %9 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFAdd %362 %364 
                                       f32_4 %366 = OpLoad %9 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %9 %367 
                              Uniform f32_4* %368 = OpAccessChain %19 %22 %21 
                                       f32_4 %369 = OpLoad %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                              Uniform f32_4* %371 = OpAccessChain %19 %349 %69 
                                       f32_4 %372 = OpLoad %371 
                                       f32_3 %373 = OpVectorShuffle %372 %372 2 2 2 
                                       f32_3 %374 = OpFMul %370 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_3 %377 = OpFAdd %374 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_4 %379 = OpVectorShuffle %378 %377 4 5 6 3 
                                                      OpStore %9 %379 
                              Uniform f32_4* %380 = OpAccessChain %19 %22 %22 
                                       f32_4 %381 = OpLoad %380 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                              Uniform f32_4* %383 = OpAccessChain %19 %349 %69 
                                       f32_4 %384 = OpLoad %383 
                                       f32_3 %385 = OpVectorShuffle %384 %384 3 3 3 
                                       f32_3 %386 = OpFMul %382 %385 
                                       f32_4 %387 = OpLoad %9 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFAdd %386 %388 
                                       f32_4 %390 = OpLoad %9 
                                       f32_4 %391 = OpVectorShuffle %390 %389 4 5 6 3 
                                                      OpStore %9 %391 
                                       f32_3 %392 = OpLoad %154 
                                       f32_3 %393 = OpLoad %154 
                                         f32 %394 = OpDot %392 %393 
                                                      OpStore %194 %394 
                                         f32 %395 = OpLoad %194 
                                         f32 %396 = OpExtInst %1 32 %395 
                                                      OpStore %194 %396 
                                         f32 %397 = OpLoad %194 
                                       f32_3 %398 = OpCompositeConstruct %397 %397 %397 
                                       f32_3 %399 = OpLoad %154 
                                       f32_3 %400 = OpFMul %398 %399 
                                       f32_4 %401 = OpLoad %50 
                                       f32_4 %402 = OpVectorShuffle %401 %400 4 5 6 3 
                                                      OpStore %50 %402 
                                       f32_4 %403 = OpLoad %9 
                                       f32_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                                       f32_4 %405 = OpLoad %50 
                                       f32_3 %406 = OpVectorShuffle %405 %405 0 1 2 
                                         f32 %407 = OpDot %404 %406 
                                Private f32* %408 = OpAccessChain %9 %31 
                                                      OpStore %408 %407 
                              Uniform f32_4* %409 = OpAccessChain %19 %22 %242 
                                       f32_4 %410 = OpLoad %409 
                                       f32_3 %411 = OpVectorShuffle %410 %410 0 1 2 
                              Uniform f32_4* %412 = OpAccessChain %19 %349 %242 
                                       f32_4 %413 = OpLoad %412 
                                       f32_3 %414 = OpVectorShuffle %413 %413 1 1 1 
                                       f32_3 %415 = OpFMul %411 %414 
                                       f32_4 %416 = OpLoad %97 
                                       f32_4 %417 = OpVectorShuffle %416 %415 4 5 6 3 
                                                      OpStore %97 %417 
                              Uniform f32_4* %418 = OpAccessChain %19 %22 %69 
                                       f32_4 %419 = OpLoad %418 
                                       f32_3 %420 = OpVectorShuffle %419 %419 0 1 2 
                              Uniform f32_4* %421 = OpAccessChain %19 %349 %242 
                                       f32_4 %422 = OpLoad %421 
                                       f32_3 %423 = OpVectorShuffle %422 %422 0 0 0 
                                       f32_3 %424 = OpFMul %420 %423 
                                       f32_4 %425 = OpLoad %97 
                                       f32_3 %426 = OpVectorShuffle %425 %425 0 1 2 
                                       f32_3 %427 = OpFAdd %424 %426 
                                       f32_4 %428 = OpLoad %97 
                                       f32_4 %429 = OpVectorShuffle %428 %427 4 5 6 3 
                                                      OpStore %97 %429 
                              Uniform f32_4* %430 = OpAccessChain %19 %22 %21 
                                       f32_4 %431 = OpLoad %430 
                                       f32_3 %432 = OpVectorShuffle %431 %431 0 1 2 
                              Uniform f32_4* %433 = OpAccessChain %19 %349 %242 
                                       f32_4 %434 = OpLoad %433 
                                       f32_3 %435 = OpVectorShuffle %434 %434 2 2 2 
                                       f32_3 %436 = OpFMul %432 %435 
                                       f32_4 %437 = OpLoad %97 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 1 2 
                                       f32_3 %439 = OpFAdd %436 %438 
                                       f32_4 %440 = OpLoad %97 
                                       f32_4 %441 = OpVectorShuffle %440 %439 4 5 6 3 
                                                      OpStore %97 %441 
                              Uniform f32_4* %442 = OpAccessChain %19 %22 %22 
                                       f32_4 %443 = OpLoad %442 
                                       f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
                              Uniform f32_4* %445 = OpAccessChain %19 %349 %242 
                                       f32_4 %446 = OpLoad %445 
                                       f32_3 %447 = OpVectorShuffle %446 %446 3 3 3 
                                       f32_3 %448 = OpFMul %444 %447 
                                       f32_4 %449 = OpLoad %97 
                                       f32_3 %450 = OpVectorShuffle %449 %449 0 1 2 
                                       f32_3 %451 = OpFAdd %448 %450 
                                       f32_4 %452 = OpLoad %97 
                                       f32_4 %453 = OpVectorShuffle %452 %451 4 5 6 3 
                                                      OpStore %97 %453 
                                       f32_4 %454 = OpLoad %97 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %50 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
                                         f32 %458 = OpDot %455 %457 
                                Private f32* %459 = OpAccessChain %9 %42 
                                                      OpStore %459 %458 
                              Uniform f32_4* %460 = OpAccessChain %19 %22 %242 
                                       f32_4 %461 = OpLoad %460 
                                       f32_3 %462 = OpVectorShuffle %461 %461 0 1 2 
                              Uniform f32_4* %463 = OpAccessChain %19 %349 %21 
                                       f32_4 %464 = OpLoad %463 
                                       f32_3 %465 = OpVectorShuffle %464 %464 1 1 1 
                                       f32_3 %466 = OpFMul %462 %465 
                                       f32_4 %467 = OpLoad %97 
                                       f32_4 %468 = OpVectorShuffle %467 %466 4 5 6 3 
                                                      OpStore %97 %468 
                              Uniform f32_4* %469 = OpAccessChain %19 %22 %69 
                                       f32_4 %470 = OpLoad %469 
                                       f32_3 %471 = OpVectorShuffle %470 %470 0 1 2 
                              Uniform f32_4* %472 = OpAccessChain %19 %349 %21 
                                       f32_4 %473 = OpLoad %472 
                                       f32_3 %474 = OpVectorShuffle %473 %473 0 0 0 
                                       f32_3 %475 = OpFMul %471 %474 
                                       f32_4 %476 = OpLoad %97 
                                       f32_3 %477 = OpVectorShuffle %476 %476 0 1 2 
                                       f32_3 %478 = OpFAdd %475 %477 
                                       f32_4 %479 = OpLoad %97 
                                       f32_4 %480 = OpVectorShuffle %479 %478 4 5 6 3 
                                                      OpStore %97 %480 
                              Uniform f32_4* %481 = OpAccessChain %19 %22 %21 
                                       f32_4 %482 = OpLoad %481 
                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                              Uniform f32_4* %484 = OpAccessChain %19 %349 %21 
                                       f32_4 %485 = OpLoad %484 
                                       f32_3 %486 = OpVectorShuffle %485 %485 2 2 2 
                                       f32_3 %487 = OpFMul %483 %486 
                                       f32_4 %488 = OpLoad %97 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpFAdd %487 %489 
                                       f32_4 %491 = OpLoad %97 
                                       f32_4 %492 = OpVectorShuffle %491 %490 4 5 6 3 
                                                      OpStore %97 %492 
                              Uniform f32_4* %493 = OpAccessChain %19 %22 %22 
                                       f32_4 %494 = OpLoad %493 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                              Uniform f32_4* %496 = OpAccessChain %19 %349 %21 
                                       f32_4 %497 = OpLoad %496 
                                       f32_3 %498 = OpVectorShuffle %497 %497 3 3 3 
                                       f32_3 %499 = OpFMul %495 %498 
                                       f32_4 %500 = OpLoad %97 
                                       f32_3 %501 = OpVectorShuffle %500 %500 0 1 2 
                                       f32_3 %502 = OpFAdd %499 %501 
                                       f32_4 %503 = OpLoad %97 
                                       f32_4 %504 = OpVectorShuffle %503 %502 4 5 6 3 
                                                      OpStore %97 %504 
                                       f32_4 %505 = OpLoad %97 
                                       f32_3 %506 = OpVectorShuffle %505 %505 0 1 2 
                                       f32_4 %507 = OpLoad %50 
                                       f32_3 %508 = OpVectorShuffle %507 %507 0 1 2 
                                         f32 %509 = OpDot %506 %508 
                                Private f32* %510 = OpAccessChain %9 %161 
                                                      OpStore %510 %509 
                                       f32_4 %511 = OpLoad %9 
                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
                                       f32_4 %513 = OpLoad %9 
                                       f32_3 %514 = OpVectorShuffle %513 %513 0 1 2 
                                         f32 %515 = OpDot %512 %514 
                                                      OpStore %194 %515 
                                         f32 %516 = OpLoad %194 
                                         f32 %517 = OpExtInst %1 32 %516 
                                                      OpStore %194 %517 
                                         f32 %518 = OpLoad %194 
                                       f32_3 %519 = OpCompositeConstruct %518 %518 %518 
                                       f32_4 %520 = OpLoad %9 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %522 = OpFMul %519 %521 
                                       f32_4 %523 = OpLoad vs_TEXCOORD1 
                                       f32_4 %524 = OpVectorShuffle %523 %522 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %524 
                                 Output f32* %525 = OpAccessChain %287 %69 %42 
                                         f32 %526 = OpLoad %525 
                                         f32 %527 = OpFNegate %526 
                                 Output f32* %528 = OpAccessChain %287 %69 %42 
                                                      OpStore %528 %527 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 62
; Schema: 0
                              OpCapability Shader 
                       %1 = OpExtInstImport "GLSL.std.450" 
                              OpMemoryModel Logical GLSL450 
                              OpEntryPoint Fragment %4 "main" %12 %29 
                              OpExecutionMode %4 OriginUpperLeft 
                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                              OpDecorate vs_TEXCOORD1 Location 12 
                              OpDecorate %29 Location 29 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 2 
                       %8 = OpTypePointer Private %7 
        Private f32_2* %9 = OpVariable Private 
                      %10 = OpTypeVector %6 4 
                      %11 = OpTypePointer Input %10 
Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      %13 = OpTypeInt 32 0 
                  u32 %14 = OpConstant 2 
                      %15 = OpTypePointer Input %6 
                  f32 %18 = OpConstant 3.674022E-40 
                  u32 %20 = OpConstant 0 
                      %21 = OpTypePointer Private %6 
                      %28 = OpTypePointer Output %10 
        Output f32_4* %29 = OpVariable Output 
                  f32 %31 = OpConstant 3.674022E-40 
                f32_2 %32 = OpConstantComposite %31 %31 
                  f32 %34 = OpConstant 3.674022E-40 
                f32_2 %35 = OpConstantComposite %34 %34 
                  f32 %41 = OpConstant 3.674022E-40 
                f32_2 %42 = OpConstantComposite %18 %41 
                  u32 %46 = OpConstant 1 
                  f32 %50 = OpConstant 3.674022E-40 
                      %55 = OpTypePointer Output %6 
                  u32 %59 = OpConstant 3 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
           Input f32* %16 = OpAccessChain vs_TEXCOORD1 %14 
                  f32 %17 = OpLoad %16 
                  f32 %19 = OpFAdd %17 %18 
         Private f32* %22 = OpAccessChain %9 %20 
                              OpStore %22 %19 
                f32_4 %23 = OpLoad vs_TEXCOORD1 
                f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                f32_2 %25 = OpLoad %9 
                f32_2 %26 = OpVectorShuffle %25 %25 0 0 
                f32_2 %27 = OpFDiv %24 %26 
                              OpStore %9 %27 
                f32_2 %30 = OpLoad %9 
                f32_2 %33 = OpFMul %30 %32 
                f32_2 %36 = OpFAdd %33 %35 
                f32_4 %37 = OpLoad %29 
                f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                              OpStore %29 %38 
                f32_4 %39 = OpLoad vs_TEXCOORD1 
                f32_2 %40 = OpVectorShuffle %39 %39 3 3 
                f32_2 %43 = OpFMul %40 %42 
                              OpStore %9 %43 
                f32_2 %44 = OpLoad %9 
                f32_2 %45 = OpExtInst %1 10 %44 
                              OpStore %9 %45 
         Private f32* %47 = OpAccessChain %9 %46 
                  f32 %48 = OpLoad %47 
                  f32 %49 = OpFNegate %48 
                  f32 %51 = OpFMul %49 %50 
         Private f32* %52 = OpAccessChain %9 %20 
                  f32 %53 = OpLoad %52 
                  f32 %54 = OpFAdd %51 %53 
          Output f32* %56 = OpAccessChain %29 %14 
                              OpStore %56 %54 
         Private f32* %57 = OpAccessChain %9 %46 
                  f32 %58 = OpLoad %57 
          Output f32* %60 = OpAccessChain %29 %59 
                              OpStore %60 %58 
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
SubShader {
 Tags { "RenderType" = "TreeLeaf" }
 Pass {
  Tags { "RenderType" = "TreeLeaf" }
  GpuProgramID 221783
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in  vec4 in_POSITION0;
in  vec4 in_TANGENT0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
float u_xlat24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat0;
    u_xlat1 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.xxxx * u_xlat2 + u_xlat1;
    u_xlat24 = -abs(in_TANGENT0.w) + 1.0;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat24) + in_POSITION0.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _TreeInstanceScale.xyz;
    u_xlat26 = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat4.y = u_xlat26 + in_COLOR0.x;
    u_xlat26 = u_xlat4.y + in_COLOR0.y;
    u_xlat4.x = dot(u_xlat3.xyz, vec3(u_xlat26));
    u_xlat4 = u_xlat4.xxyy + _Time.yyyy;
    u_xlat4 = u_xlat4 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = abs(u_xlat4) * abs(u_xlat4);
    u_xlat4 = -abs(u_xlat4) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat4 = u_xlat4 * u_xlat5;
    u_xlat4.xy = u_xlat4.yw + u_xlat4.xz;
    u_xlat5.xyz = u_xlat4.yyy * _Wind.xyz;
    u_xlat5.xyz = u_xlat5.xyz * in_TEXCOORD1.yyy;
    u_xlat6.y = u_xlat4.y * in_TEXCOORD1.y;
    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat7;
    u_xlat1 = in_NORMAL0.zzzz * u_xlat7 + u_xlat1;
    u_xlat25 = dot(u_xlat1, u_xlat1);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat25) + (-in_NORMAL0.xyz);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + in_NORMAL0.xyz;
    u_xlat24 = in_COLOR0.y * 0.100000001;
    u_xlat6.xz = u_xlat1.xz * vec2(u_xlat24);
    u_xlat4.z = 0.300000012;
    u_xlat4.xyz = u_xlat4.xzx * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat4.xyz * _Wind.www + u_xlat3.xyz;
    u_xlat3.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat3.xyz;
    u_xlat24 = dot(_SquashPlaneNormal.xyz, u_xlat3.xyz);
    u_xlat24 = u_xlat24 + _SquashPlaneNormal.w;
    u_xlat4.xyz = (-vec3(u_xlat24)) * _SquashPlaneNormal.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(_SquashAmount) * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.z = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = u_xlat3.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat3.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat3.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
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
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 551
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %61 %105 %120 %143 %225 %436 %447 %448 %493 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %61 Location 61 
                                                      OpDecorate %105 Location 105 
                                                      OpDecorate %120 Location 120 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %225 Location 225 
                                                      OpMemberDecorate %434 0 BuiltIn 434 
                                                      OpMemberDecorate %434 1 BuiltIn 434 
                                                      OpMemberDecorate %434 2 BuiltIn 434 
                                                      OpDecorate %434 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 447 
                                                      OpDecorate %448 Location 448 
                                                      OpDecorate vs_TEXCOORD1 Location 493 
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
                                              %16 = OpTypeArray %7 %11 
                                              %17 = OpTypeStruct %7 %7 %12 %13 %14 %15 %16 %7 %7 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 3 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %26 = OpConstant 5 
                                          i32 %31 = OpConstant 0 
                                          i32 %40 = OpConstant 2 
                               Private f32_4* %57 = OpVariable Private 
                                              %59 = OpTypeVector %6 3 
                                              %60 = OpTypePointer Input %59 
                                 Input f32_3* %61 = OpVariable Input 
                               Private f32_4* %65 = OpVariable Private 
                                             %102 = OpTypePointer Private %6 
                                Private f32* %103 = OpVariable Private 
                                             %104 = OpTypePointer Input %7 
                                Input f32_4* %105 = OpVariable Input 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Input %6 
                                         f32 %112 = OpConstant 3.674022E-40 
                              Private f32_4* %114 = OpVariable Private 
                                Input f32_4* %120 = OpVariable Input 
                                         i32 %128 = OpConstant 7 
                                Private f32* %135 = OpVariable Private 
                                       f32_3 %139 = OpConstantComposite %112 %112 %112 
                              Private f32_4* %141 = OpVariable Private 
                                Input f32_4* %143 = OpVariable Input 
                                         u32 %144 = OpConstant 0 
                                         u32 %148 = OpConstant 1 
                                         f32 %168 = OpConstant 3.674022E-40 
                                         f32 %169 = OpConstant 3.674022E-40 
                                         f32 %170 = OpConstant 3.674022E-40 
                                         f32 %171 = OpConstant 3.674022E-40 
                                       f32_4 %172 = OpConstantComposite %168 %169 %170 %171 
                                         f32 %177 = OpConstant 3.674022E-40 
                                       f32_4 %178 = OpConstantComposite %177 %177 %177 %177 
                                         f32 %180 = OpConstant 3.674022E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                                         f32 %187 = OpConstant 3.674022E-40 
                                       f32_4 %188 = OpConstantComposite %187 %187 %187 %187 
                              Private f32_4* %190 = OpVariable Private 
                                         f32 %200 = OpConstant 3.674022E-40 
                                       f32_4 %201 = OpConstantComposite %200 %200 %200 %200 
                                             %206 = OpTypeVector %6 2 
                                         i32 %216 = OpConstant 10 
                                Input f32_4* %225 = OpVariable Input 
                                             %231 = OpTypePointer Private %59 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_4* %239 = OpVariable Private 
                                Private f32* %276 = OpVariable Private 
                                         f32 %303 = OpConstant 3.674022E-40 
                                         f32 %312 = OpConstant 3.674022E-40 
                                         u32 %313 = OpConstant 2 
                                         i32 %346 = OpConstant 8 
                                             %354 = OpTypePointer Uniform %6 
                                         i32 %378 = OpConstant 9 
                                         i32 %415 = OpConstant 6 
                                             %433 = OpTypeArray %6 %148 
                                             %434 = OpTypeStruct %7 %6 %433 
                                             %435 = OpTypePointer Output %434 
        Output struct {f32_4; f32; f32[1];}* %436 = OpVariable Output 
                                             %444 = OpTypePointer Output %7 
                                             %446 = OpTypePointer Output %206 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %448 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %503 = OpConstant 4 
                                             %544 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %24 = OpAccessChain %19 %21 %22 
                                        f32_4 %25 = OpLoad %24 
                               Uniform f32_4* %27 = OpAccessChain %19 %26 %22 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpVectorShuffle %28 %28 1 1 1 1 
                                        f32_4 %30 = OpFMul %25 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %32 = OpAccessChain %19 %21 %31 
                                        f32_4 %33 = OpLoad %32 
                               Uniform f32_4* %34 = OpAccessChain %19 %26 %22 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 0 0 0 
                                        f32_4 %37 = OpFMul %33 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpFAdd %37 %38 
                                                      OpStore %9 %39 
                               Uniform f32_4* %41 = OpAccessChain %19 %21 %40 
                                        f32_4 %42 = OpLoad %41 
                               Uniform f32_4* %43 = OpAccessChain %19 %26 %22 
                                        f32_4 %44 = OpLoad %43 
                                        f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                        f32_4 %46 = OpFMul %42 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_4 %48 = OpFAdd %46 %47 
                                                      OpStore %9 %48 
                               Uniform f32_4* %49 = OpAccessChain %19 %21 %21 
                                        f32_4 %50 = OpLoad %49 
                               Uniform f32_4* %51 = OpAccessChain %19 %26 %22 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %50 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %62 = OpLoad %61 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                                        f32_4 %64 = OpFMul %58 %63 
                                                      OpStore %57 %64 
                               Uniform f32_4* %66 = OpAccessChain %19 %21 %22 
                                        f32_4 %67 = OpLoad %66 
                               Uniform f32_4* %68 = OpAccessChain %19 %26 %31 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpVectorShuffle %69 %69 1 1 1 1 
                                        f32_4 %71 = OpFMul %67 %70 
                                                      OpStore %65 %71 
                               Uniform f32_4* %72 = OpAccessChain %19 %21 %31 
                                        f32_4 %73 = OpLoad %72 
                               Uniform f32_4* %74 = OpAccessChain %19 %26 %31 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpVectorShuffle %75 %75 0 0 0 0 
                                        f32_4 %77 = OpFMul %73 %76 
                                        f32_4 %78 = OpLoad %65 
                                        f32_4 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                               Uniform f32_4* %80 = OpAccessChain %19 %21 %40 
                                        f32_4 %81 = OpLoad %80 
                               Uniform f32_4* %82 = OpAccessChain %19 %26 %31 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                        f32_4 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %65 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %65 %87 
                               Uniform f32_4* %88 = OpAccessChain %19 %21 %21 
                                        f32_4 %89 = OpLoad %88 
                               Uniform f32_4* %90 = OpAccessChain %19 %26 %31 
                                        f32_4 %91 = OpLoad %90 
                                        f32_4 %92 = OpVectorShuffle %91 %91 3 3 3 3 
                                        f32_4 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %65 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %65 %95 
                                        f32_3 %96 = OpLoad %61 
                                        f32_4 %97 = OpVectorShuffle %96 %96 0 0 0 0 
                                        f32_4 %98 = OpLoad %65 
                                        f32_4 %99 = OpFMul %97 %98 
                                       f32_4 %100 = OpLoad %57 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %57 %101 
                                  Input f32* %108 = OpAccessChain %105 %106 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpExtInst %1 4 %109 
                                         f32 %111 = OpFNegate %110 
                                         f32 %113 = OpFAdd %111 %112 
                                                      OpStore %103 %113 
                                       f32_4 %115 = OpLoad %57 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpLoad %103 
                                       f32_3 %118 = OpCompositeConstruct %117 %117 %117 
                                       f32_3 %119 = OpFMul %116 %118 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %119 %122 
                                       f32_4 %124 = OpLoad %114 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %114 %125 
                                       f32_4 %126 = OpLoad %114 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                              Uniform f32_4* %129 = OpAccessChain %19 %128 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %127 %131 
                                       f32_4 %133 = OpLoad %114 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
                                                      OpStore %114 %134 
                              Uniform f32_4* %136 = OpAccessChain %19 %40 %21 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %140 = OpDot %138 %139 
                                                      OpStore %135 %140 
                                         f32 %142 = OpLoad %135 
                                  Input f32* %145 = OpAccessChain %143 %144 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFAdd %142 %146 
                                Private f32* %149 = OpAccessChain %141 %148 
                                                      OpStore %149 %147 
                                Private f32* %150 = OpAccessChain %141 %148 
                                         f32 %151 = OpLoad %150 
                                  Input f32* %152 = OpAccessChain %143 %148 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFAdd %151 %153 
                                                      OpStore %135 %154 
                                       f32_4 %155 = OpLoad %114 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpLoad %135 
                                       f32_3 %158 = OpCompositeConstruct %157 %157 %157 
                                         f32 %159 = OpDot %156 %158 
                                Private f32* %160 = OpAccessChain %141 %144 
                                                      OpStore %160 %159 
                                       f32_4 %161 = OpLoad %141 
                                       f32_4 %162 = OpVectorShuffle %161 %161 0 0 1 1 
                              Uniform f32_4* %163 = OpAccessChain %19 %31 
                                       f32_4 %164 = OpLoad %163 
                                       f32_4 %165 = OpVectorShuffle %164 %164 1 1 1 1 
                                       f32_4 %166 = OpFAdd %162 %165 
                                                      OpStore %141 %166 
                                       f32_4 %167 = OpLoad %141 
                                       f32_4 %173 = OpFMul %167 %172 
                                                      OpStore %141 %173 
                                       f32_4 %174 = OpLoad %141 
                                       f32_4 %175 = OpExtInst %1 10 %174 
                                                      OpStore %141 %175 
                                       f32_4 %176 = OpLoad %141 
                                       f32_4 %179 = OpFMul %176 %178 
                                       f32_4 %182 = OpFAdd %179 %181 
                                                      OpStore %141 %182 
                                       f32_4 %183 = OpLoad %141 
                                       f32_4 %184 = OpExtInst %1 10 %183 
                                                      OpStore %141 %184 
                                       f32_4 %185 = OpLoad %141 
                                       f32_4 %186 = OpFMul %185 %178 
                                       f32_4 %189 = OpFAdd %186 %188 
                                                      OpStore %141 %189 
                                       f32_4 %191 = OpLoad %141 
                                       f32_4 %192 = OpExtInst %1 4 %191 
                                       f32_4 %193 = OpLoad %141 
                                       f32_4 %194 = OpExtInst %1 4 %193 
                                       f32_4 %195 = OpFMul %192 %194 
                                                      OpStore %190 %195 
                                       f32_4 %196 = OpLoad %141 
                                       f32_4 %197 = OpExtInst %1 4 %196 
                                       f32_4 %198 = OpFNegate %197 
                                       f32_4 %199 = OpFMul %198 %178 
                                       f32_4 %202 = OpFAdd %199 %201 
                                                      OpStore %141 %202 
                                       f32_4 %203 = OpLoad %141 
                                       f32_4 %204 = OpLoad %190 
                                       f32_4 %205 = OpFMul %203 %204 
                                                      OpStore %141 %205 
                                       f32_4 %207 = OpLoad %141 
                                       f32_2 %208 = OpVectorShuffle %207 %207 1 3 
                                       f32_4 %209 = OpLoad %141 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 2 
                                       f32_2 %211 = OpFAdd %208 %210 
                                       f32_4 %212 = OpLoad %141 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 2 3 
                                                      OpStore %141 %213 
                                       f32_4 %214 = OpLoad %141 
                                       f32_3 %215 = OpVectorShuffle %214 %214 1 1 1 
                              Uniform f32_4* %217 = OpAccessChain %19 %216 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                       f32_3 %220 = OpFMul %215 %219 
                                       f32_4 %221 = OpLoad %190 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                                      OpStore %190 %222 
                                       f32_4 %223 = OpLoad %190 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 1 1 1 
                                       f32_3 %228 = OpFMul %224 %227 
                                       f32_4 %229 = OpLoad %190 
                                       f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
                                                      OpStore %190 %230 
                                Private f32* %233 = OpAccessChain %141 %148 
                                         f32 %234 = OpLoad %233 
                                  Input f32* %235 = OpAccessChain %225 %148 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %234 %236 
                                Private f32* %238 = OpAccessChain %232 %148 
                                                      OpStore %238 %237 
                              Uniform f32_4* %240 = OpAccessChain %19 %21 %22 
                                       f32_4 %241 = OpLoad %240 
                              Uniform f32_4* %242 = OpAccessChain %19 %26 %40 
                                       f32_4 %243 = OpLoad %242 
                                       f32_4 %244 = OpVectorShuffle %243 %243 1 1 1 1 
                                       f32_4 %245 = OpFMul %241 %244 
                                                      OpStore %239 %245 
                              Uniform f32_4* %246 = OpAccessChain %19 %21 %31 
                                       f32_4 %247 = OpLoad %246 
                              Uniform f32_4* %248 = OpAccessChain %19 %26 %40 
                                       f32_4 %249 = OpLoad %248 
                                       f32_4 %250 = OpVectorShuffle %249 %249 0 0 0 0 
                                       f32_4 %251 = OpFMul %247 %250 
                                       f32_4 %252 = OpLoad %239 
                                       f32_4 %253 = OpFAdd %251 %252 
                                                      OpStore %239 %253 
                              Uniform f32_4* %254 = OpAccessChain %19 %21 %40 
                                       f32_4 %255 = OpLoad %254 
                              Uniform f32_4* %256 = OpAccessChain %19 %26 %40 
                                       f32_4 %257 = OpLoad %256 
                                       f32_4 %258 = OpVectorShuffle %257 %257 2 2 2 2 
                                       f32_4 %259 = OpFMul %255 %258 
                                       f32_4 %260 = OpLoad %239 
                                       f32_4 %261 = OpFAdd %259 %260 
                                                      OpStore %239 %261 
                              Uniform f32_4* %262 = OpAccessChain %19 %21 %21 
                                       f32_4 %263 = OpLoad %262 
                              Uniform f32_4* %264 = OpAccessChain %19 %26 %40 
                                       f32_4 %265 = OpLoad %264 
                                       f32_4 %266 = OpVectorShuffle %265 %265 3 3 3 3 
                                       f32_4 %267 = OpFMul %263 %266 
                                       f32_4 %268 = OpLoad %239 
                                       f32_4 %269 = OpFAdd %267 %268 
                                                      OpStore %239 %269 
                                       f32_3 %270 = OpLoad %61 
                                       f32_4 %271 = OpVectorShuffle %270 %270 2 2 2 2 
                                       f32_4 %272 = OpLoad %239 
                                       f32_4 %273 = OpFMul %271 %272 
                                       f32_4 %274 = OpLoad %57 
                                       f32_4 %275 = OpFAdd %273 %274 
                                                      OpStore %57 %275 
                                       f32_4 %277 = OpLoad %57 
                                       f32_4 %278 = OpLoad %57 
                                         f32 %279 = OpDot %277 %278 
                                                      OpStore %276 %279 
                                         f32 %280 = OpLoad %276 
                                         f32 %281 = OpExtInst %1 32 %280 
                                                      OpStore %276 %281 
                                       f32_4 %282 = OpLoad %57 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                         f32 %284 = OpLoad %276 
                                       f32_3 %285 = OpCompositeConstruct %284 %284 %284 
                                       f32_3 %286 = OpFMul %283 %285 
                                       f32_3 %287 = OpLoad %61 
                                       f32_3 %288 = OpFNegate %287 
                                       f32_3 %289 = OpFAdd %286 %288 
                                       f32_4 %290 = OpLoad %57 
                                       f32_4 %291 = OpVectorShuffle %290 %289 4 5 6 3 
                                                      OpStore %57 %291 
                                         f32 %292 = OpLoad %103 
                                       f32_3 %293 = OpCompositeConstruct %292 %292 %292 
                                       f32_4 %294 = OpLoad %57 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                                       f32_3 %296 = OpFMul %293 %295 
                                       f32_3 %297 = OpLoad %61 
                                       f32_3 %298 = OpFAdd %296 %297 
                                       f32_4 %299 = OpLoad %57 
                                       f32_4 %300 = OpVectorShuffle %299 %298 4 5 6 3 
                                                      OpStore %57 %300 
                                  Input f32* %301 = OpAccessChain %143 %148 
                                         f32 %302 = OpLoad %301 
                                         f32 %304 = OpFMul %302 %303 
                                                      OpStore %103 %304 
                                       f32_4 %305 = OpLoad %57 
                                       f32_2 %306 = OpVectorShuffle %305 %305 0 2 
                                         f32 %307 = OpLoad %103 
                                       f32_2 %308 = OpCompositeConstruct %307 %307 
                                       f32_2 %309 = OpFMul %306 %308 
                                       f32_3 %310 = OpLoad %232 
                                       f32_3 %311 = OpVectorShuffle %310 %309 3 1 4 
                                                      OpStore %232 %311 
                                Private f32* %314 = OpAccessChain %141 %313 
                                                      OpStore %314 %312 
                                       f32_4 %315 = OpLoad %141 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 2 0 
                                       f32_3 %317 = OpLoad %232 
                                       f32_3 %318 = OpFMul %316 %317 
                                       f32_4 %319 = OpLoad %190 
                                       f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                                       f32_3 %321 = OpFAdd %318 %320 
                                       f32_4 %322 = OpLoad %141 
                                       f32_4 %323 = OpVectorShuffle %322 %321 4 5 6 3 
                                                      OpStore %141 %323 
                                       f32_4 %324 = OpLoad %141 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                              Uniform f32_4* %326 = OpAccessChain %19 %216 
                                       f32_4 %327 = OpLoad %326 
                                       f32_3 %328 = OpVectorShuffle %327 %327 3 3 3 
                                       f32_3 %329 = OpFMul %325 %328 
                                       f32_4 %330 = OpLoad %114 
                                       f32_3 %331 = OpVectorShuffle %330 %330 0 1 2 
                                       f32_3 %332 = OpFAdd %329 %331 
                                       f32_4 %333 = OpLoad %114 
                                       f32_4 %334 = OpVectorShuffle %333 %332 4 5 6 3 
                                                      OpStore %114 %334 
                                       f32_4 %335 = OpLoad %225 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 0 0 
                              Uniform f32_4* %337 = OpAccessChain %19 %216 
                                       f32_4 %338 = OpLoad %337 
                                       f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                                       f32_3 %340 = OpFMul %336 %339 
                                       f32_4 %341 = OpLoad %114 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 1 2 
                                       f32_3 %343 = OpFAdd %340 %342 
                                       f32_4 %344 = OpLoad %114 
                                       f32_4 %345 = OpVectorShuffle %344 %343 4 5 6 3 
                                                      OpStore %114 %345 
                              Uniform f32_4* %347 = OpAccessChain %19 %346 
                                       f32_4 %348 = OpLoad %347 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 1 2 
                                       f32_4 %350 = OpLoad %114 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                         f32 %352 = OpDot %349 %351 
                                                      OpStore %103 %352 
                                         f32 %353 = OpLoad %103 
                                Uniform f32* %355 = OpAccessChain %19 %346 %106 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %353 %356 
                                                      OpStore %103 %357 
                                         f32 %358 = OpLoad %103 
                                       f32_3 %359 = OpCompositeConstruct %358 %358 %358 
                                       f32_3 %360 = OpFNegate %359 
                              Uniform f32_4* %361 = OpAccessChain %19 %346 
                                       f32_4 %362 = OpLoad %361 
                                       f32_3 %363 = OpVectorShuffle %362 %362 0 1 2 
                                       f32_3 %364 = OpFMul %360 %363 
                                       f32_4 %365 = OpLoad %114 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFAdd %364 %366 
                                       f32_4 %368 = OpLoad %141 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %141 %369 
                                       f32_4 %370 = OpLoad %114 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_4 %372 = OpLoad %141 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFNegate %373 
                                       f32_3 %375 = OpFAdd %371 %374 
                                       f32_4 %376 = OpLoad %114 
                                       f32_4 %377 = OpVectorShuffle %376 %375 4 5 6 3 
                                                      OpStore %114 %377 
                                Uniform f32* %379 = OpAccessChain %19 %378 
                                         f32 %380 = OpLoad %379 
                                       f32_3 %381 = OpCompositeConstruct %380 %380 %380 
                                       f32_4 %382 = OpLoad %114 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                       f32_3 %384 = OpFMul %381 %383 
                                       f32_4 %385 = OpLoad %141 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_3 %387 = OpFAdd %384 %386 
                                       f32_4 %388 = OpLoad %114 
                                       f32_4 %389 = OpVectorShuffle %388 %387 4 5 6 3 
                                                      OpStore %114 %389 
                                       f32_4 %390 = OpLoad %114 
                                       f32_4 %391 = OpVectorShuffle %390 %390 1 1 1 1 
                              Uniform f32_4* %392 = OpAccessChain %19 %40 %22 
                                       f32_4 %393 = OpLoad %392 
                                       f32_4 %394 = OpFMul %391 %393 
                                                      OpStore %141 %394 
                              Uniform f32_4* %395 = OpAccessChain %19 %40 %31 
                                       f32_4 %396 = OpLoad %395 
                                       f32_4 %397 = OpLoad %114 
                                       f32_4 %398 = OpVectorShuffle %397 %397 0 0 0 0 
                                       f32_4 %399 = OpFMul %396 %398 
                                       f32_4 %400 = OpLoad %141 
                                       f32_4 %401 = OpFAdd %399 %400 
                                                      OpStore %141 %401 
                              Uniform f32_4* %402 = OpAccessChain %19 %40 %40 
                                       f32_4 %403 = OpLoad %402 
                                       f32_4 %404 = OpLoad %114 
                                       f32_4 %405 = OpVectorShuffle %404 %404 2 2 2 2 
                                       f32_4 %406 = OpFMul %403 %405 
                                       f32_4 %407 = OpLoad %141 
                                       f32_4 %408 = OpFAdd %406 %407 
                                                      OpStore %114 %408 
                                       f32_4 %409 = OpLoad %114 
                              Uniform f32_4* %410 = OpAccessChain %19 %40 %21 
                                       f32_4 %411 = OpLoad %410 
                                       f32_4 %412 = OpFAdd %409 %411 
                                                      OpStore %114 %412 
                                       f32_4 %413 = OpLoad %114 
                                       f32_4 %414 = OpVectorShuffle %413 %413 1 1 1 1 
                              Uniform f32_4* %416 = OpAccessChain %19 %415 %22 
                                       f32_4 %417 = OpLoad %416 
                                       f32_4 %418 = OpFMul %414 %417 
                                                      OpStore %141 %418 
                              Uniform f32_4* %419 = OpAccessChain %19 %415 %31 
                                       f32_4 %420 = OpLoad %419 
                                       f32_4 %421 = OpLoad %114 
                                       f32_4 %422 = OpVectorShuffle %421 %421 0 0 0 0 
                                       f32_4 %423 = OpFMul %420 %422 
                                       f32_4 %424 = OpLoad %141 
                                       f32_4 %425 = OpFAdd %423 %424 
                                                      OpStore %141 %425 
                              Uniform f32_4* %426 = OpAccessChain %19 %415 %40 
                                       f32_4 %427 = OpLoad %426 
                                       f32_4 %428 = OpLoad %114 
                                       f32_4 %429 = OpVectorShuffle %428 %428 2 2 2 2 
                                       f32_4 %430 = OpFMul %427 %429 
                                       f32_4 %431 = OpLoad %141 
                                       f32_4 %432 = OpFAdd %430 %431 
                                                      OpStore %141 %432 
                              Uniform f32_4* %437 = OpAccessChain %19 %415 %21 
                                       f32_4 %438 = OpLoad %437 
                                       f32_4 %439 = OpLoad %114 
                                       f32_4 %440 = OpVectorShuffle %439 %439 3 3 3 3 
                                       f32_4 %441 = OpFMul %438 %440 
                                       f32_4 %442 = OpLoad %141 
                                       f32_4 %443 = OpFAdd %441 %442 
                               Output f32_4* %445 = OpAccessChain %436 %31 
                                                      OpStore %445 %443 
                                       f32_4 %449 = OpLoad %448 
                                       f32_2 %450 = OpVectorShuffle %449 %449 0 1 
                                                      OpStore vs_TEXCOORD0 %450 
                                       f32_4 %451 = OpLoad %57 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 2 
                                       f32_4 %453 = OpLoad %57 
                                       f32_3 %454 = OpVectorShuffle %453 %453 0 1 2 
                                         f32 %455 = OpDot %452 %454 
                                                      OpStore %103 %455 
                                         f32 %456 = OpLoad %103 
                                         f32 %457 = OpExtInst %1 32 %456 
                                                      OpStore %103 %457 
                                         f32 %458 = OpLoad %103 
                                       f32_3 %459 = OpCompositeConstruct %458 %458 %458 
                                       f32_4 %460 = OpLoad %57 
                                       f32_3 %461 = OpVectorShuffle %460 %460 0 1 2 
                                       f32_3 %462 = OpFMul %459 %461 
                                       f32_4 %463 = OpLoad %57 
                                       f32_4 %464 = OpVectorShuffle %463 %462 4 5 6 3 
                                                      OpStore %57 %464 
                                       f32_4 %465 = OpLoad %65 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_4 %467 = OpLoad %57 
                                       f32_3 %468 = OpVectorShuffle %467 %467 0 1 2 
                                         f32 %469 = OpDot %466 %468 
                                Private f32* %470 = OpAccessChain %65 %144 
                                                      OpStore %470 %469 
                                       f32_4 %471 = OpLoad %9 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 1 2 
                                       f32_4 %473 = OpLoad %57 
                                       f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
                                         f32 %475 = OpDot %472 %474 
                                Private f32* %476 = OpAccessChain %65 %148 
                                                      OpStore %476 %475 
                                       f32_4 %477 = OpLoad %239 
                                       f32_3 %478 = OpVectorShuffle %477 %477 0 1 2 
                                       f32_4 %479 = OpLoad %57 
                                       f32_3 %480 = OpVectorShuffle %479 %479 0 1 2 
                                         f32 %481 = OpDot %478 %480 
                                Private f32* %482 = OpAccessChain %65 %313 
                                                      OpStore %482 %481 
                                       f32_4 %483 = OpLoad %65 
                                       f32_3 %484 = OpVectorShuffle %483 %483 0 1 2 
                                       f32_4 %485 = OpLoad %65 
                                       f32_3 %486 = OpVectorShuffle %485 %485 0 1 2 
                                         f32 %487 = OpDot %484 %486 
                                Private f32* %488 = OpAccessChain %9 %144 
                                                      OpStore %488 %487 
                                Private f32* %489 = OpAccessChain %9 %144 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpExtInst %1 32 %490 
                                Private f32* %492 = OpAccessChain %9 %144 
                                                      OpStore %492 %491 
                                       f32_4 %494 = OpLoad %9 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 0 0 
                                       f32_4 %496 = OpLoad %65 
                                       f32_3 %497 = OpVectorShuffle %496 %496 0 1 2 
                                       f32_3 %498 = OpFMul %495 %497 
                                       f32_4 %499 = OpLoad vs_TEXCOORD1 
                                       f32_4 %500 = OpVectorShuffle %499 %498 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %500 
                                Private f32* %501 = OpAccessChain %114 %148 
                                         f32 %502 = OpLoad %501 
                                Uniform f32* %504 = OpAccessChain %19 %503 %22 %313 
                                         f32 %505 = OpLoad %504 
                                         f32 %506 = OpFMul %502 %505 
                                Private f32* %507 = OpAccessChain %9 %144 
                                                      OpStore %507 %506 
                                Uniform f32* %508 = OpAccessChain %19 %503 %31 %313 
                                         f32 %509 = OpLoad %508 
                                Private f32* %510 = OpAccessChain %114 %144 
                                         f32 %511 = OpLoad %510 
                                         f32 %512 = OpFMul %509 %511 
                                Private f32* %513 = OpAccessChain %9 %144 
                                         f32 %514 = OpLoad %513 
                                         f32 %515 = OpFAdd %512 %514 
                                Private f32* %516 = OpAccessChain %9 %144 
                                                      OpStore %516 %515 
                                Uniform f32* %517 = OpAccessChain %19 %503 %40 %313 
                                         f32 %518 = OpLoad %517 
                                Private f32* %519 = OpAccessChain %114 %313 
                                         f32 %520 = OpLoad %519 
                                         f32 %521 = OpFMul %518 %520 
                                Private f32* %522 = OpAccessChain %9 %144 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpFAdd %521 %523 
                                Private f32* %525 = OpAccessChain %9 %144 
                                                      OpStore %525 %524 
                                Uniform f32* %526 = OpAccessChain %19 %503 %21 %313 
                                         f32 %527 = OpLoad %526 
                                Private f32* %528 = OpAccessChain %114 %106 
                                         f32 %529 = OpLoad %528 
                                         f32 %530 = OpFMul %527 %529 
                                Private f32* %531 = OpAccessChain %9 %144 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpFAdd %530 %532 
                                Private f32* %534 = OpAccessChain %9 %144 
                                                      OpStore %534 %533 
                                Private f32* %535 = OpAccessChain %9 %144 
                                         f32 %536 = OpLoad %535 
                                Uniform f32* %537 = OpAccessChain %19 %22 %106 
                                         f32 %538 = OpLoad %537 
                                         f32 %539 = OpFMul %536 %538 
                                Private f32* %540 = OpAccessChain %9 %144 
                                                      OpStore %540 %539 
                                Private f32* %541 = OpAccessChain %9 %144 
                                         f32 %542 = OpLoad %541 
                                         f32 %543 = OpFNegate %542 
                                 Output f32* %545 = OpAccessChain vs_TEXCOORD1 %106 
                                                      OpStore %545 %543 
                                 Output f32* %546 = OpAccessChain %436 %31 %148 
                                         f32 %547 = OpLoad %546 
                                         f32 %548 = OpFNegate %547 
                                 Output f32* %549 = OpAccessChain %436 %31 %148 
                                                      OpStore %549 %548 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 107
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %75 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate vs_TEXCOORD1 Location 61 
                                             OpDecorate %75 Location 75 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypeStruct %6 
                                     %34 = OpTypePointer Uniform %33 
              Uniform struct {f32;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                     %38 = OpTypePointer Uniform %6 
                                     %44 = OpTypeBool 
                                     %45 = OpTypePointer Private %44 
                       Private bool* %46 = OpVariable Private 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 i32 %52 = OpConstant 1 
                                 i32 %54 = OpConstant -1 
                                     %60 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 u32 %62 = OpConstant 2 
                                     %63 = OpTypePointer Input %6 
                                 f32 %66 = OpConstant 3.674022E-40 
                                     %74 = OpTypePointer Output %23 
                       Output f32_4* %75 = OpVariable Output 
                                 f32 %77 = OpConstant 3.674022E-40 
                               f32_2 %78 = OpConstantComposite %77 %77 
                                 f32 %80 = OpConstant 3.674022E-40 
                               f32_2 %81 = OpConstantComposite %80 %80 
                                 f32 %87 = OpConstant 3.674022E-40 
                               f32_2 %88 = OpConstantComposite %66 %87 
                                 u32 %92 = OpConstant 1 
                                 f32 %96 = OpConstant 3.674022E-40 
                                    %101 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFNegate %40 
                                 f32 %42 = OpFAdd %32 %41 
                        Private f32* %43 = OpAccessChain %9 %28 
                                             OpStore %43 %42 
                        Private f32* %47 = OpAccessChain %9 %28 
                                 f32 %48 = OpLoad %47 
                                bool %50 = OpFOrdLessThan %48 %49 
                                             OpStore %46 %50 
                                bool %51 = OpLoad %46 
                                 i32 %53 = OpSelect %51 %52 %37 
                                 i32 %55 = OpIMul %53 %54 
                                bool %56 = OpINotEqual %55 %37 
                                             OpSelectionMerge %58 None 
                                             OpBranchConditional %56 %57 %58 
                                     %57 = OpLabel 
                                             OpKill
                                     %58 = OpLabel 
                          Input f32* %64 = OpAccessChain vs_TEXCOORD1 %62 
                                 f32 %65 = OpLoad %64 
                                 f32 %67 = OpFAdd %65 %66 
                        Private f32* %68 = OpAccessChain %9 %28 
                                             OpStore %68 %67 
                               f32_4 %69 = OpLoad vs_TEXCOORD1 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpLoad %9 
                               f32_2 %72 = OpVectorShuffle %71 %71 0 0 
                               f32_2 %73 = OpFDiv %70 %72 
                                             OpStore %9 %73 
                               f32_2 %76 = OpLoad %9 
                               f32_2 %79 = OpFMul %76 %78 
                               f32_2 %82 = OpFAdd %79 %81 
                               f32_4 %83 = OpLoad %75 
                               f32_4 %84 = OpVectorShuffle %83 %82 4 5 2 3 
                                             OpStore %75 %84 
                               f32_4 %85 = OpLoad vs_TEXCOORD1 
                               f32_2 %86 = OpVectorShuffle %85 %85 3 3 
                               f32_2 %89 = OpFMul %86 %88 
                                             OpStore %9 %89 
                               f32_2 %90 = OpLoad %9 
                               f32_2 %91 = OpExtInst %1 10 %90 
                                             OpStore %9 %91 
                        Private f32* %93 = OpAccessChain %9 %92 
                                 f32 %94 = OpLoad %93 
                                 f32 %95 = OpFNegate %94 
                                 f32 %97 = OpFMul %95 %96 
                        Private f32* %98 = OpAccessChain %9 %28 
                                 f32 %99 = OpLoad %98 
                                f32 %100 = OpFAdd %97 %99 
                        Output f32* %102 = OpAccessChain %75 %62 
                                             OpStore %102 %100 
                       Private f32* %103 = OpAccessChain %9 %92 
                                f32 %104 = OpLoad %103 
                        Output f32* %105 = OpAccessChain %75 %26 
                                             OpStore %105 %104 
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
SubShader {
 Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
  GpuProgramID 290987
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD0.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 416
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %82 %188 %238 %293 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %82 Location 82 
                                                      OpMemberDecorate %186 0 BuiltIn 186 
                                                      OpMemberDecorate %186 1 BuiltIn 186 
                                                      OpMemberDecorate %186 2 BuiltIn 186 
                                                      OpDecorate %186 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 238 
                                                      OpDecorate %293 Location 293 
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
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeArray %7 %16 
                                              %23 = OpTypeStruct %7 %17 %18 %19 %20 %21 %7 %22 %7 %6 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 6 
                                              %28 = OpTypePointer Uniform %7 
                               Private f32_4* %35 = OpVariable Private 
                                          i32 %38 = OpConstant 7 
                                          i32 %39 = OpConstant 1 
                                          i32 %46 = OpConstant 0 
                                          i32 %58 = OpConstant 2 
                                 Input f32_4* %82 = OpVariable Input 
                                              %93 = OpTypePointer Private %6 
                                 Private f32* %94 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                         u32 %103 = OpConstant 3 
                                             %104 = OpTypePointer Uniform %6 
                                         i32 %128 = OpConstant 9 
                                         i32 %160 = OpConstant 3 
                                         i32 %166 = OpConstant 5 
                                         u32 %184 = OpConstant 1 
                                             %185 = OpTypeArray %6 %184 
                                             %186 = OpTypeStruct %7 %6 %185 
                                             %187 = OpTypePointer Output %186 
        Output struct {f32_4; f32; f32[1];}* %188 = OpVariable Output 
                                             %196 = OpTypePointer Output %7 
                                Private f32* %198 = OpVariable Private 
                                         u32 %201 = OpConstant 2 
                                         u32 %207 = OpConstant 0 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
                                         i32 %247 = OpConstant 4 
                                             %292 = OpTypePointer Input %12 
                                Input f32_3* %293 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %29 = OpAccessChain %25 %27 
                                        f32_4 %30 = OpLoad %29 
                                        f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                                        f32_3 %32 = OpFMul %14 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpVectorShuffle %33 %32 4 5 6 3 
                                                      OpStore %9 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %36 1 1 1 
                               Uniform f32_4* %40 = OpAccessChain %25 %38 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                                        f32_3 %43 = OpFMul %37 %42 
                                        f32_4 %44 = OpLoad %35 
                                        f32_4 %45 = OpVectorShuffle %44 %43 4 5 6 3 
                                                      OpStore %35 %45 
                               Uniform f32_4* %47 = OpAccessChain %25 %38 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 0 0 
                                        f32_3 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %35 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFAdd %52 %54 
                                        f32_4 %56 = OpLoad %35 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 6 3 
                                                      OpStore %35 %57 
                               Uniform f32_4* %59 = OpAccessChain %25 %38 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 2 2 2 
                                        f32_3 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %35 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpFAdd %64 %66 
                                        f32_4 %68 = OpLoad %35 
                                        f32_4 %69 = OpVectorShuffle %68 %67 4 5 6 3 
                                                      OpStore %35 %69 
                                        f32_4 %70 = OpLoad %11 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFNegate %71 
                               Uniform f32_4* %73 = OpAccessChain %25 %27 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFMul %72 %75 
                                        f32_4 %77 = OpLoad %35 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFAdd %76 %78 
                                        f32_4 %80 = OpLoad %35 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %35 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 3 3 3 
                                        f32_4 %85 = OpLoad %35 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFAdd %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                      OpStore %9 %92 
                               Uniform f32_4* %96 = OpAccessChain %25 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                         f32 %101 = OpDot %98 %100 
                                                      OpStore %94 %101 
                                         f32 %102 = OpLoad %94 
                                Uniform f32* %105 = OpAccessChain %25 %95 %103 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpFAdd %102 %106 
                                                      OpStore %94 %107 
                                         f32 %108 = OpLoad %94 
                                       f32_3 %109 = OpCompositeConstruct %108 %108 %108 
                                       f32_3 %110 = OpFNegate %109 
                              Uniform f32_4* %111 = OpAccessChain %25 %95 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %35 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %35 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %35 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %121 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                      OpStore %9 %127 
                                Uniform f32* %129 = OpAccessChain %25 %128 
                                         f32 %130 = OpLoad %129 
                                       f32_3 %131 = OpCompositeConstruct %130 %130 %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %35 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %9 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %9 %139 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %140 1 1 1 1 
                              Uniform f32_4* %142 = OpAccessChain %25 %39 %39 
                                       f32_4 %143 = OpLoad %142 
                                       f32_4 %144 = OpFMul %141 %143 
                                                      OpStore %35 %144 
                              Uniform f32_4* %145 = OpAccessChain %25 %39 %46 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %9 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 0 0 0 
                                       f32_4 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %35 
                                       f32_4 %151 = OpFAdd %149 %150 
                                                      OpStore %35 %151 
                              Uniform f32_4* %152 = OpAccessChain %25 %39 %58 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %35 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                              Uniform f32_4* %161 = OpAccessChain %25 %39 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %159 %162 
                                                      OpStore %9 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %164 1 1 1 1 
                              Uniform f32_4* %167 = OpAccessChain %25 %166 %39 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpFMul %165 %168 
                                                      OpStore %35 %169 
                              Uniform f32_4* %170 = OpAccessChain %25 %166 %46 
                                       f32_4 %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %172 0 0 0 0 
                                       f32_4 %174 = OpFMul %171 %173 
                                       f32_4 %175 = OpLoad %35 
                                       f32_4 %176 = OpFAdd %174 %175 
                                                      OpStore %35 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %166 %58 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_4 %180 = OpVectorShuffle %179 %179 2 2 2 2 
                                       f32_4 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %35 
                                       f32_4 %183 = OpFAdd %181 %182 
                                                      OpStore %35 %183 
                              Uniform f32_4* %189 = OpAccessChain %25 %166 %160 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %191 3 3 3 3 
                                       f32_4 %193 = OpFMul %190 %192 
                                       f32_4 %194 = OpLoad %35 
                                       f32_4 %195 = OpFAdd %193 %194 
                               Output f32_4* %197 = OpAccessChain %188 %46 
                                                      OpStore %197 %195 
                                Private f32* %199 = OpAccessChain %9 %184 
                                         f32 %200 = OpLoad %199 
                                Uniform f32* %202 = OpAccessChain %25 %160 %39 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %200 %203 
                                                      OpStore %198 %204 
                                Uniform f32* %205 = OpAccessChain %25 %160 %46 %201 
                                         f32 %206 = OpLoad %205 
                                Private f32* %208 = OpAccessChain %9 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %206 %209 
                                         f32 %211 = OpLoad %198 
                                         f32 %212 = OpFAdd %210 %211 
                                Private f32* %213 = OpAccessChain %9 %207 
                                                      OpStore %213 %212 
                                Uniform f32* %214 = OpAccessChain %25 %160 %58 %201 
                                         f32 %215 = OpLoad %214 
                                Private f32* %216 = OpAccessChain %9 %201 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFMul %215 %217 
                                Private f32* %219 = OpAccessChain %9 %207 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFAdd %218 %220 
                                Private f32* %222 = OpAccessChain %9 %207 
                                                      OpStore %222 %221 
                                Uniform f32* %223 = OpAccessChain %25 %160 %160 %201 
                                         f32 %224 = OpLoad %223 
                                Private f32* %225 = OpAccessChain %9 %103 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %224 %226 
                                Private f32* %228 = OpAccessChain %9 %207 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFAdd %227 %229 
                                Private f32* %231 = OpAccessChain %9 %207 
                                                      OpStore %231 %230 
                                Private f32* %232 = OpAccessChain %9 %207 
                                         f32 %233 = OpLoad %232 
                                Uniform f32* %234 = OpAccessChain %25 %46 %103 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %233 %235 
                                Private f32* %237 = OpAccessChain %9 %207 
                                                      OpStore %237 %236 
                                Private f32* %239 = OpAccessChain %9 %207 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFNegate %240 
                                 Output f32* %243 = OpAccessChain vs_TEXCOORD0 %103 
                                                      OpStore %243 %241 
                              Uniform f32_4* %244 = OpAccessChain %25 %58 %39 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                              Uniform f32_4* %248 = OpAccessChain %25 %247 %46 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 1 1 1 
                                       f32_3 %251 = OpFMul %246 %250 
                                       f32_4 %252 = OpLoad %9 
                                       f32_4 %253 = OpVectorShuffle %252 %251 4 5 6 3 
                                                      OpStore %9 %253 
                              Uniform f32_4* %254 = OpAccessChain %25 %58 %46 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                              Uniform f32_4* %257 = OpAccessChain %25 %247 %46 
                                       f32_4 %258 = OpLoad %257 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
                                       f32_3 %260 = OpFMul %256 %259 
                                       f32_4 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpFAdd %260 %262 
                                       f32_4 %264 = OpLoad %9 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %9 %265 
                              Uniform f32_4* %266 = OpAccessChain %25 %58 %58 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                              Uniform f32_4* %269 = OpAccessChain %25 %247 %46 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 2 2 2 
                                       f32_3 %272 = OpFMul %268 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %9 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %9 %277 
                              Uniform f32_4* %278 = OpAccessChain %25 %58 %160 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                              Uniform f32_4* %281 = OpAccessChain %25 %247 %46 
                                       f32_4 %282 = OpLoad %281 
                                       f32_3 %283 = OpVectorShuffle %282 %282 3 3 3 
                                       f32_3 %284 = OpFMul %280 %283 
                                       f32_4 %285 = OpLoad %9 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFAdd %284 %286 
                                       f32_4 %288 = OpLoad %9 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %9 %289 
                                       f32_4 %290 = OpLoad %9 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                                       f32_3 %294 = OpLoad %293 
                                         f32 %295 = OpDot %291 %294 
                                Private f32* %296 = OpAccessChain %9 %207 
                                                      OpStore %296 %295 
                              Uniform f32_4* %297 = OpAccessChain %25 %58 %39 
                                       f32_4 %298 = OpLoad %297 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                              Uniform f32_4* %300 = OpAccessChain %25 %247 %39 
                                       f32_4 %301 = OpLoad %300 
                                       f32_3 %302 = OpVectorShuffle %301 %301 1 1 1 
                                       f32_3 %303 = OpFMul %299 %302 
                                       f32_4 %304 = OpLoad %35 
                                       f32_4 %305 = OpVectorShuffle %304 %303 4 5 6 3 
                                                      OpStore %35 %305 
                              Uniform f32_4* %306 = OpAccessChain %25 %58 %46 
                                       f32_4 %307 = OpLoad %306 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                              Uniform f32_4* %309 = OpAccessChain %25 %247 %39 
                                       f32_4 %310 = OpLoad %309 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 0 0 
                                       f32_3 %312 = OpFMul %308 %311 
                                       f32_4 %313 = OpLoad %35 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpFAdd %312 %314 
                                       f32_4 %316 = OpLoad %35 
                                       f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                                      OpStore %35 %317 
                              Uniform f32_4* %318 = OpAccessChain %25 %58 %58 
                                       f32_4 %319 = OpLoad %318 
                                       f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                              Uniform f32_4* %321 = OpAccessChain %25 %247 %39 
                                       f32_4 %322 = OpLoad %321 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %320 %323 
                                       f32_4 %325 = OpLoad %35 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %35 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %35 %329 
                              Uniform f32_4* %330 = OpAccessChain %25 %58 %160 
                                       f32_4 %331 = OpLoad %330 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                              Uniform f32_4* %333 = OpAccessChain %25 %247 %39 
                                       f32_4 %334 = OpLoad %333 
                                       f32_3 %335 = OpVectorShuffle %334 %334 3 3 3 
                                       f32_3 %336 = OpFMul %332 %335 
                                       f32_4 %337 = OpLoad %35 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
                                       f32_3 %339 = OpFAdd %336 %338 
                                       f32_4 %340 = OpLoad %35 
                                       f32_4 %341 = OpVectorShuffle %340 %339 4 5 6 3 
                                                      OpStore %35 %341 
                                       f32_4 %342 = OpLoad %35 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_3 %344 = OpLoad %293 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %346 = OpAccessChain %9 %184 
                                                      OpStore %346 %345 
                              Uniform f32_4* %347 = OpAccessChain %25 %58 %39 
                                       f32_4 %348 = OpLoad %347 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 1 2 
                              Uniform f32_4* %350 = OpAccessChain %25 %247 %58 
                                       f32_4 %351 = OpLoad %350 
                                       f32_3 %352 = OpVectorShuffle %351 %351 1 1 1 
                                       f32_3 %353 = OpFMul %349 %352 
                                       f32_4 %354 = OpLoad %35 
                                       f32_4 %355 = OpVectorShuffle %354 %353 4 5 6 3 
                                                      OpStore %35 %355 
                              Uniform f32_4* %356 = OpAccessChain %25 %58 %46 
                                       f32_4 %357 = OpLoad %356 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
                              Uniform f32_4* %359 = OpAccessChain %25 %247 %58 
                                       f32_4 %360 = OpLoad %359 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 0 0 
                                       f32_3 %362 = OpFMul %358 %361 
                                       f32_4 %363 = OpLoad %35 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFAdd %362 %364 
                                       f32_4 %366 = OpLoad %35 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %35 %367 
                              Uniform f32_4* %368 = OpAccessChain %25 %58 %58 
                                       f32_4 %369 = OpLoad %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                              Uniform f32_4* %371 = OpAccessChain %25 %247 %58 
                                       f32_4 %372 = OpLoad %371 
                                       f32_3 %373 = OpVectorShuffle %372 %372 2 2 2 
                                       f32_3 %374 = OpFMul %370 %373 
                                       f32_4 %375 = OpLoad %35 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_3 %377 = OpFAdd %374 %376 
                                       f32_4 %378 = OpLoad %35 
                                       f32_4 %379 = OpVectorShuffle %378 %377 4 5 6 3 
                                                      OpStore %35 %379 
                              Uniform f32_4* %380 = OpAccessChain %25 %58 %160 
                                       f32_4 %381 = OpLoad %380 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                              Uniform f32_4* %383 = OpAccessChain %25 %247 %58 
                                       f32_4 %384 = OpLoad %383 
                                       f32_3 %385 = OpVectorShuffle %384 %384 3 3 3 
                                       f32_3 %386 = OpFMul %382 %385 
                                       f32_4 %387 = OpLoad %35 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFAdd %386 %388 
                                       f32_4 %390 = OpLoad %35 
                                       f32_4 %391 = OpVectorShuffle %390 %389 4 5 6 3 
                                                      OpStore %35 %391 
                                       f32_4 %392 = OpLoad %35 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 2 
                                       f32_3 %394 = OpLoad %293 
                                         f32 %395 = OpDot %393 %394 
                                Private f32* %396 = OpAccessChain %9 %201 
                                                      OpStore %396 %395 
                                       f32_4 %397 = OpLoad %9 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_4 %399 = OpLoad %9 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                         f32 %401 = OpDot %398 %400 
                                                      OpStore %94 %401 
                                         f32 %402 = OpLoad %94 
                                         f32 %403 = OpExtInst %1 32 %402 
                                                      OpStore %94 %403 
                                         f32 %404 = OpLoad %94 
                                       f32_3 %405 = OpCompositeConstruct %404 %404 %404 
                                       f32_4 %406 = OpLoad %9 
                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                                       f32_3 %408 = OpFMul %405 %407 
                                       f32_4 %409 = OpLoad vs_TEXCOORD0 
                                       f32_4 %410 = OpVectorShuffle %409 %408 4 5 6 3 
                                                      OpStore vs_TEXCOORD0 %410 
                                 Output f32* %411 = OpAccessChain %188 %46 %184 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFNegate %412 
                                 Output f32* %414 = OpAccessChain %188 %46 %184 
                                                      OpStore %414 %413 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 62
; Schema: 0
                              OpCapability Shader 
                       %1 = OpExtInstImport "GLSL.std.450" 
                              OpMemoryModel Logical GLSL450 
                              OpEntryPoint Fragment %4 "main" %12 %29 
                              OpExecutionMode %4 OriginUpperLeft 
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate vs_TEXCOORD0 Location 12 
                              OpDecorate %29 Location 29 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 2 
                       %8 = OpTypePointer Private %7 
        Private f32_2* %9 = OpVariable Private 
                      %10 = OpTypeVector %6 4 
                      %11 = OpTypePointer Input %10 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                      %13 = OpTypeInt 32 0 
                  u32 %14 = OpConstant 2 
                      %15 = OpTypePointer Input %6 
                  f32 %18 = OpConstant 3.674022E-40 
                  u32 %20 = OpConstant 0 
                      %21 = OpTypePointer Private %6 
                      %28 = OpTypePointer Output %10 
        Output f32_4* %29 = OpVariable Output 
                  f32 %31 = OpConstant 3.674022E-40 
                f32_2 %32 = OpConstantComposite %31 %31 
                  f32 %34 = OpConstant 3.674022E-40 
                f32_2 %35 = OpConstantComposite %34 %34 
                  f32 %41 = OpConstant 3.674022E-40 
                f32_2 %42 = OpConstantComposite %18 %41 
                  u32 %46 = OpConstant 1 
                  f32 %50 = OpConstant 3.674022E-40 
                      %55 = OpTypePointer Output %6 
                  u32 %59 = OpConstant 3 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
           Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                  f32 %17 = OpLoad %16 
                  f32 %19 = OpFAdd %17 %18 
         Private f32* %22 = OpAccessChain %9 %20 
                              OpStore %22 %19 
                f32_4 %23 = OpLoad vs_TEXCOORD0 
                f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                f32_2 %25 = OpLoad %9 
                f32_2 %26 = OpVectorShuffle %25 %25 0 0 
                f32_2 %27 = OpFDiv %24 %26 
                              OpStore %9 %27 
                f32_2 %30 = OpLoad %9 
                f32_2 %33 = OpFMul %30 %32 
                f32_2 %36 = OpFAdd %33 %35 
                f32_4 %37 = OpLoad %29 
                f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                              OpStore %29 %38 
                f32_4 %39 = OpLoad vs_TEXCOORD0 
                f32_2 %40 = OpVectorShuffle %39 %39 3 3 
                f32_2 %43 = OpFMul %40 %42 
                              OpStore %9 %43 
                f32_2 %44 = OpLoad %9 
                f32_2 %45 = OpExtInst %1 10 %44 
                              OpStore %9 %45 
         Private f32* %47 = OpAccessChain %9 %46 
                  f32 %48 = OpLoad %47 
                  f32 %49 = OpFNegate %48 
                  f32 %51 = OpFMul %49 %50 
         Private f32* %52 = OpAccessChain %9 %20 
                  f32 %53 = OpLoad %52 
                  f32 %54 = OpFAdd %51 %53 
          Output f32* %56 = OpAccessChain %29 %14 
                              OpStore %56 %54 
         Private f32* %57 = OpAccessChain %9 %46 
                  f32 %58 = OpLoad %57 
          Output f32* %60 = OpAccessChain %29 %59 
                              OpStore %60 %58 
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
SubShader {
 Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
  GpuProgramID 346673
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 422
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %82 %188 %200 %201 %244 %299 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %82 Location 82 
                                                      OpMemberDecorate %186 0 BuiltIn 186 
                                                      OpMemberDecorate %186 1 BuiltIn 186 
                                                      OpMemberDecorate %186 2 BuiltIn 186 
                                                      OpDecorate %186 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 200 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate vs_TEXCOORD1 Location 244 
                                                      OpDecorate %299 Location 299 
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
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeArray %7 %16 
                                              %23 = OpTypeStruct %7 %17 %18 %19 %20 %21 %7 %22 %7 %6 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 6 
                                              %28 = OpTypePointer Uniform %7 
                               Private f32_4* %35 = OpVariable Private 
                                          i32 %38 = OpConstant 7 
                                          i32 %39 = OpConstant 1 
                                          i32 %46 = OpConstant 0 
                                          i32 %58 = OpConstant 2 
                                 Input f32_4* %82 = OpVariable Input 
                                              %93 = OpTypePointer Private %6 
                                 Private f32* %94 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                         u32 %103 = OpConstant 3 
                                             %104 = OpTypePointer Uniform %6 
                                         i32 %128 = OpConstant 9 
                                         i32 %160 = OpConstant 3 
                                         i32 %166 = OpConstant 5 
                                         u32 %184 = OpConstant 1 
                                             %185 = OpTypeArray %6 %184 
                                             %186 = OpTypeStruct %7 %6 %185 
                                             %187 = OpTypePointer Output %186 
        Output struct {f32_4; f32; f32[1];}* %188 = OpVariable Output 
                                             %196 = OpTypePointer Output %7 
                                             %198 = OpTypeVector %6 2 
                                             %199 = OpTypePointer Output %198 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %201 = OpVariable Input 
                                Private f32* %204 = OpVariable Private 
                                         u32 %207 = OpConstant 2 
                                         u32 %213 = OpConstant 0 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %248 = OpTypePointer Output %6 
                                         i32 %253 = OpConstant 4 
                                             %298 = OpTypePointer Input %12 
                                Input f32_3* %299 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %29 = OpAccessChain %25 %27 
                                        f32_4 %30 = OpLoad %29 
                                        f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                                        f32_3 %32 = OpFMul %14 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpVectorShuffle %33 %32 4 5 6 3 
                                                      OpStore %9 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %36 1 1 1 
                               Uniform f32_4* %40 = OpAccessChain %25 %38 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                                        f32_3 %43 = OpFMul %37 %42 
                                        f32_4 %44 = OpLoad %35 
                                        f32_4 %45 = OpVectorShuffle %44 %43 4 5 6 3 
                                                      OpStore %35 %45 
                               Uniform f32_4* %47 = OpAccessChain %25 %38 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 0 0 
                                        f32_3 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %35 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFAdd %52 %54 
                                        f32_4 %56 = OpLoad %35 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 6 3 
                                                      OpStore %35 %57 
                               Uniform f32_4* %59 = OpAccessChain %25 %38 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 2 2 2 
                                        f32_3 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %35 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpFAdd %64 %66 
                                        f32_4 %68 = OpLoad %35 
                                        f32_4 %69 = OpVectorShuffle %68 %67 4 5 6 3 
                                                      OpStore %35 %69 
                                        f32_4 %70 = OpLoad %11 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFNegate %71 
                               Uniform f32_4* %73 = OpAccessChain %25 %27 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFMul %72 %75 
                                        f32_4 %77 = OpLoad %35 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFAdd %76 %78 
                                        f32_4 %80 = OpLoad %35 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %35 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 3 3 3 
                                        f32_4 %85 = OpLoad %35 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFAdd %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                      OpStore %9 %92 
                               Uniform f32_4* %96 = OpAccessChain %25 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                         f32 %101 = OpDot %98 %100 
                                                      OpStore %94 %101 
                                         f32 %102 = OpLoad %94 
                                Uniform f32* %105 = OpAccessChain %25 %95 %103 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpFAdd %102 %106 
                                                      OpStore %94 %107 
                                         f32 %108 = OpLoad %94 
                                       f32_3 %109 = OpCompositeConstruct %108 %108 %108 
                                       f32_3 %110 = OpFNegate %109 
                              Uniform f32_4* %111 = OpAccessChain %25 %95 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %35 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %35 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %35 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %121 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                      OpStore %9 %127 
                                Uniform f32* %129 = OpAccessChain %25 %128 
                                         f32 %130 = OpLoad %129 
                                       f32_3 %131 = OpCompositeConstruct %130 %130 %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %35 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %9 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %9 %139 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %140 1 1 1 1 
                              Uniform f32_4* %142 = OpAccessChain %25 %39 %39 
                                       f32_4 %143 = OpLoad %142 
                                       f32_4 %144 = OpFMul %141 %143 
                                                      OpStore %35 %144 
                              Uniform f32_4* %145 = OpAccessChain %25 %39 %46 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %9 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 0 0 0 
                                       f32_4 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %35 
                                       f32_4 %151 = OpFAdd %149 %150 
                                                      OpStore %35 %151 
                              Uniform f32_4* %152 = OpAccessChain %25 %39 %58 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %35 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                              Uniform f32_4* %161 = OpAccessChain %25 %39 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %159 %162 
                                                      OpStore %9 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %164 1 1 1 1 
                              Uniform f32_4* %167 = OpAccessChain %25 %166 %39 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpFMul %165 %168 
                                                      OpStore %35 %169 
                              Uniform f32_4* %170 = OpAccessChain %25 %166 %46 
                                       f32_4 %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %172 0 0 0 0 
                                       f32_4 %174 = OpFMul %171 %173 
                                       f32_4 %175 = OpLoad %35 
                                       f32_4 %176 = OpFAdd %174 %175 
                                                      OpStore %35 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %166 %58 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_4 %180 = OpVectorShuffle %179 %179 2 2 2 2 
                                       f32_4 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %35 
                                       f32_4 %183 = OpFAdd %181 %182 
                                                      OpStore %35 %183 
                              Uniform f32_4* %189 = OpAccessChain %25 %166 %160 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %191 3 3 3 3 
                                       f32_4 %193 = OpFMul %190 %192 
                                       f32_4 %194 = OpLoad %35 
                                       f32_4 %195 = OpFAdd %193 %194 
                               Output f32_4* %197 = OpAccessChain %188 %46 
                                                      OpStore %197 %195 
                                       f32_4 %202 = OpLoad %201 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                                                      OpStore vs_TEXCOORD0 %203 
                                Private f32* %205 = OpAccessChain %9 %184 
                                         f32 %206 = OpLoad %205 
                                Uniform f32* %208 = OpAccessChain %25 %160 %39 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %206 %209 
                                                      OpStore %204 %210 
                                Uniform f32* %211 = OpAccessChain %25 %160 %46 %207 
                                         f32 %212 = OpLoad %211 
                                Private f32* %214 = OpAccessChain %9 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFMul %212 %215 
                                         f32 %217 = OpLoad %204 
                                         f32 %218 = OpFAdd %216 %217 
                                Private f32* %219 = OpAccessChain %9 %213 
                                                      OpStore %219 %218 
                                Uniform f32* %220 = OpAccessChain %25 %160 %58 %207 
                                         f32 %221 = OpLoad %220 
                                Private f32* %222 = OpAccessChain %9 %207 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %221 %223 
                                Private f32* %225 = OpAccessChain %9 %213 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFAdd %224 %226 
                                Private f32* %228 = OpAccessChain %9 %213 
                                                      OpStore %228 %227 
                                Uniform f32* %229 = OpAccessChain %25 %160 %160 %207 
                                         f32 %230 = OpLoad %229 
                                Private f32* %231 = OpAccessChain %9 %103 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFMul %230 %232 
                                Private f32* %234 = OpAccessChain %9 %213 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFAdd %233 %235 
                                Private f32* %237 = OpAccessChain %9 %213 
                                                      OpStore %237 %236 
                                Private f32* %238 = OpAccessChain %9 %213 
                                         f32 %239 = OpLoad %238 
                                Uniform f32* %240 = OpAccessChain %25 %46 %103 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFMul %239 %241 
                                Private f32* %243 = OpAccessChain %9 %213 
                                                      OpStore %243 %242 
                                Private f32* %245 = OpAccessChain %9 %213 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                 Output f32* %249 = OpAccessChain vs_TEXCOORD1 %103 
                                                      OpStore %249 %247 
                              Uniform f32_4* %250 = OpAccessChain %25 %58 %39 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %25 %253 %46 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 1 1 1 
                                       f32_3 %257 = OpFMul %252 %256 
                                       f32_4 %258 = OpLoad %9 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %9 %259 
                              Uniform f32_4* %260 = OpAccessChain %25 %58 %46 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %25 %253 %46 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 0 0 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_3 %269 = OpFAdd %266 %268 
                                       f32_4 %270 = OpLoad %9 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %9 %271 
                              Uniform f32_4* %272 = OpAccessChain %25 %58 %58 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                              Uniform f32_4* %275 = OpAccessChain %25 %253 %46 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 2 2 2 
                                       f32_3 %278 = OpFMul %274 %277 
                                       f32_4 %279 = OpLoad %9 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpFAdd %278 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %9 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %58 %160 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %253 %46 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 3 3 3 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_4 %291 = OpLoad %9 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_3 %293 = OpFAdd %290 %292 
                                       f32_4 %294 = OpLoad %9 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %9 %295 
                                       f32_4 %296 = OpLoad %9 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                                       f32_3 %300 = OpLoad %299 
                                         f32 %301 = OpDot %297 %300 
                                Private f32* %302 = OpAccessChain %9 %213 
                                                      OpStore %302 %301 
                              Uniform f32_4* %303 = OpAccessChain %25 %58 %39 
                                       f32_4 %304 = OpLoad %303 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                              Uniform f32_4* %306 = OpAccessChain %25 %253 %39 
                                       f32_4 %307 = OpLoad %306 
                                       f32_3 %308 = OpVectorShuffle %307 %307 1 1 1 
                                       f32_3 %309 = OpFMul %305 %308 
                                       f32_4 %310 = OpLoad %35 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 6 3 
                                                      OpStore %35 %311 
                              Uniform f32_4* %312 = OpAccessChain %25 %58 %46 
                                       f32_4 %313 = OpLoad %312 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                              Uniform f32_4* %315 = OpAccessChain %25 %253 %39 
                                       f32_4 %316 = OpLoad %315 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 0 0 
                                       f32_3 %318 = OpFMul %314 %317 
                                       f32_4 %319 = OpLoad %35 
                                       f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                                       f32_3 %321 = OpFAdd %318 %320 
                                       f32_4 %322 = OpLoad %35 
                                       f32_4 %323 = OpVectorShuffle %322 %321 4 5 6 3 
                                                      OpStore %35 %323 
                              Uniform f32_4* %324 = OpAccessChain %25 %58 %58 
                                       f32_4 %325 = OpLoad %324 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                              Uniform f32_4* %327 = OpAccessChain %25 %253 %39 
                                       f32_4 %328 = OpLoad %327 
                                       f32_3 %329 = OpVectorShuffle %328 %328 2 2 2 
                                       f32_3 %330 = OpFMul %326 %329 
                                       f32_4 %331 = OpLoad %35 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %35 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %35 %335 
                              Uniform f32_4* %336 = OpAccessChain %25 %58 %160 
                                       f32_4 %337 = OpLoad %336 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
                              Uniform f32_4* %339 = OpAccessChain %25 %253 %39 
                                       f32_4 %340 = OpLoad %339 
                                       f32_3 %341 = OpVectorShuffle %340 %340 3 3 3 
                                       f32_3 %342 = OpFMul %338 %341 
                                       f32_4 %343 = OpLoad %35 
                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
                                       f32_3 %345 = OpFAdd %342 %344 
                                       f32_4 %346 = OpLoad %35 
                                       f32_4 %347 = OpVectorShuffle %346 %345 4 5 6 3 
                                                      OpStore %35 %347 
                                       f32_4 %348 = OpLoad %35 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 1 2 
                                       f32_3 %350 = OpLoad %299 
                                         f32 %351 = OpDot %349 %350 
                                Private f32* %352 = OpAccessChain %9 %184 
                                                      OpStore %352 %351 
                              Uniform f32_4* %353 = OpAccessChain %25 %58 %39 
                                       f32_4 %354 = OpLoad %353 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                              Uniform f32_4* %356 = OpAccessChain %25 %253 %58 
                                       f32_4 %357 = OpLoad %356 
                                       f32_3 %358 = OpVectorShuffle %357 %357 1 1 1 
                                       f32_3 %359 = OpFMul %355 %358 
                                       f32_4 %360 = OpLoad %35 
                                       f32_4 %361 = OpVectorShuffle %360 %359 4 5 6 3 
                                                      OpStore %35 %361 
                              Uniform f32_4* %362 = OpAccessChain %25 %58 %46 
                                       f32_4 %363 = OpLoad %362 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                              Uniform f32_4* %365 = OpAccessChain %25 %253 %58 
                                       f32_4 %366 = OpLoad %365 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 0 0 
                                       f32_3 %368 = OpFMul %364 %367 
                                       f32_4 %369 = OpLoad %35 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFAdd %368 %370 
                                       f32_4 %372 = OpLoad %35 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %35 %373 
                              Uniform f32_4* %374 = OpAccessChain %25 %58 %58 
                                       f32_4 %375 = OpLoad %374 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                              Uniform f32_4* %377 = OpAccessChain %25 %253 %58 
                                       f32_4 %378 = OpLoad %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 2 2 2 
                                       f32_3 %380 = OpFMul %376 %379 
                                       f32_4 %381 = OpLoad %35 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                       f32_3 %383 = OpFAdd %380 %382 
                                       f32_4 %384 = OpLoad %35 
                                       f32_4 %385 = OpVectorShuffle %384 %383 4 5 6 3 
                                                      OpStore %35 %385 
                              Uniform f32_4* %386 = OpAccessChain %25 %58 %160 
                                       f32_4 %387 = OpLoad %386 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                              Uniform f32_4* %389 = OpAccessChain %25 %253 %58 
                                       f32_4 %390 = OpLoad %389 
                                       f32_3 %391 = OpVectorShuffle %390 %390 3 3 3 
                                       f32_3 %392 = OpFMul %388 %391 
                                       f32_4 %393 = OpLoad %35 
                                       f32_3 %394 = OpVectorShuffle %393 %393 0 1 2 
                                       f32_3 %395 = OpFAdd %392 %394 
                                       f32_4 %396 = OpLoad %35 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 5 6 3 
                                                      OpStore %35 %397 
                                       f32_4 %398 = OpLoad %35 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 1 2 
                                       f32_3 %400 = OpLoad %299 
                                         f32 %401 = OpDot %399 %400 
                                Private f32* %402 = OpAccessChain %9 %207 
                                                      OpStore %402 %401 
                                       f32_4 %403 = OpLoad %9 
                                       f32_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                                       f32_4 %405 = OpLoad %9 
                                       f32_3 %406 = OpVectorShuffle %405 %405 0 1 2 
                                         f32 %407 = OpDot %404 %406 
                                                      OpStore %94 %407 
                                         f32 %408 = OpLoad %94 
                                         f32 %409 = OpExtInst %1 32 %408 
                                                      OpStore %94 %409 
                                         f32 %410 = OpLoad %94 
                                       f32_3 %411 = OpCompositeConstruct %410 %410 %410 
                                       f32_4 %412 = OpLoad %9 
                                       f32_3 %413 = OpVectorShuffle %412 %412 0 1 2 
                                       f32_3 %414 = OpFMul %411 %413 
                                       f32_4 %415 = OpLoad vs_TEXCOORD1 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %416 
                                 Output f32* %417 = OpAccessChain %188 %46 %184 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFNegate %418 
                                 Output f32* %420 = OpAccessChain %188 %46 %184 
                                                      OpStore %420 %419 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 107
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %75 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate vs_TEXCOORD1 Location 61 
                                             OpDecorate %75 Location 75 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypeStruct %6 
                                     %34 = OpTypePointer Uniform %33 
              Uniform struct {f32;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                     %38 = OpTypePointer Uniform %6 
                                     %44 = OpTypeBool 
                                     %45 = OpTypePointer Private %44 
                       Private bool* %46 = OpVariable Private 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 i32 %52 = OpConstant 1 
                                 i32 %54 = OpConstant -1 
                                     %60 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 u32 %62 = OpConstant 2 
                                     %63 = OpTypePointer Input %6 
                                 f32 %66 = OpConstant 3.674022E-40 
                                     %74 = OpTypePointer Output %23 
                       Output f32_4* %75 = OpVariable Output 
                                 f32 %77 = OpConstant 3.674022E-40 
                               f32_2 %78 = OpConstantComposite %77 %77 
                                 f32 %80 = OpConstant 3.674022E-40 
                               f32_2 %81 = OpConstantComposite %80 %80 
                                 f32 %87 = OpConstant 3.674022E-40 
                               f32_2 %88 = OpConstantComposite %66 %87 
                                 u32 %92 = OpConstant 1 
                                 f32 %96 = OpConstant 3.674022E-40 
                                    %101 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFNegate %40 
                                 f32 %42 = OpFAdd %32 %41 
                        Private f32* %43 = OpAccessChain %9 %28 
                                             OpStore %43 %42 
                        Private f32* %47 = OpAccessChain %9 %28 
                                 f32 %48 = OpLoad %47 
                                bool %50 = OpFOrdLessThan %48 %49 
                                             OpStore %46 %50 
                                bool %51 = OpLoad %46 
                                 i32 %53 = OpSelect %51 %52 %37 
                                 i32 %55 = OpIMul %53 %54 
                                bool %56 = OpINotEqual %55 %37 
                                             OpSelectionMerge %58 None 
                                             OpBranchConditional %56 %57 %58 
                                     %57 = OpLabel 
                                             OpKill
                                     %58 = OpLabel 
                          Input f32* %64 = OpAccessChain vs_TEXCOORD1 %62 
                                 f32 %65 = OpLoad %64 
                                 f32 %67 = OpFAdd %65 %66 
                        Private f32* %68 = OpAccessChain %9 %28 
                                             OpStore %68 %67 
                               f32_4 %69 = OpLoad vs_TEXCOORD1 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpLoad %9 
                               f32_2 %72 = OpVectorShuffle %71 %71 0 0 
                               f32_2 %73 = OpFDiv %70 %72 
                                             OpStore %9 %73 
                               f32_2 %76 = OpLoad %9 
                               f32_2 %79 = OpFMul %76 %78 
                               f32_2 %82 = OpFAdd %79 %81 
                               f32_4 %83 = OpLoad %75 
                               f32_4 %84 = OpVectorShuffle %83 %82 4 5 2 3 
                                             OpStore %75 %84 
                               f32_4 %85 = OpLoad vs_TEXCOORD1 
                               f32_2 %86 = OpVectorShuffle %85 %85 3 3 
                               f32_2 %89 = OpFMul %86 %88 
                                             OpStore %9 %89 
                               f32_2 %90 = OpLoad %9 
                               f32_2 %91 = OpExtInst %1 10 %90 
                                             OpStore %9 %91 
                        Private f32* %93 = OpAccessChain %9 %92 
                                 f32 %94 = OpLoad %93 
                                 f32 %95 = OpFNegate %94 
                                 f32 %97 = OpFMul %95 %96 
                        Private f32* %98 = OpAccessChain %9 %28 
                                 f32 %99 = OpLoad %98 
                                f32 %100 = OpFAdd %97 %99 
                        Output f32* %102 = OpAccessChain %75 %62 
                                             OpStore %102 %100 
                       Private f32* %103 = OpAccessChain %9 %92 
                                f32 %104 = OpLoad %103 
                        Output f32* %105 = OpAccessChain %75 %26 
                                             OpStore %105 %104 
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
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
  Cull Front
  GpuProgramID 411418
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = (-u_xlat0.xyz);
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
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 427
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %82 %188 %200 %201 %244 %299 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %82 Location 82 
                                                      OpMemberDecorate %186 0 BuiltIn 186 
                                                      OpMemberDecorate %186 1 BuiltIn 186 
                                                      OpMemberDecorate %186 2 BuiltIn 186 
                                                      OpDecorate %186 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 200 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate vs_TEXCOORD1 Location 244 
                                                      OpDecorate %299 Location 299 
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
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeArray %7 %16 
                                              %23 = OpTypeStruct %7 %17 %18 %19 %20 %21 %7 %22 %7 %6 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 6 
                                              %28 = OpTypePointer Uniform %7 
                               Private f32_4* %35 = OpVariable Private 
                                          i32 %38 = OpConstant 7 
                                          i32 %39 = OpConstant 1 
                                          i32 %46 = OpConstant 0 
                                          i32 %58 = OpConstant 2 
                                 Input f32_4* %82 = OpVariable Input 
                                              %93 = OpTypePointer Private %6 
                                 Private f32* %94 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                         u32 %103 = OpConstant 3 
                                             %104 = OpTypePointer Uniform %6 
                                         i32 %128 = OpConstant 9 
                                         i32 %160 = OpConstant 3 
                                         i32 %166 = OpConstant 5 
                                         u32 %184 = OpConstant 1 
                                             %185 = OpTypeArray %6 %184 
                                             %186 = OpTypeStruct %7 %6 %185 
                                             %187 = OpTypePointer Output %186 
        Output struct {f32_4; f32; f32[1];}* %188 = OpVariable Output 
                                             %196 = OpTypePointer Output %7 
                                             %198 = OpTypeVector %6 2 
                                             %199 = OpTypePointer Output %198 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %201 = OpVariable Input 
                                Private f32* %204 = OpVariable Private 
                                         u32 %207 = OpConstant 2 
                                         u32 %213 = OpConstant 0 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %248 = OpTypePointer Output %6 
                                         i32 %253 = OpConstant 4 
                                             %298 = OpTypePointer Input %12 
                                Input f32_3* %299 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %29 = OpAccessChain %25 %27 
                                        f32_4 %30 = OpLoad %29 
                                        f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                                        f32_3 %32 = OpFMul %14 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpVectorShuffle %33 %32 4 5 6 3 
                                                      OpStore %9 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %36 1 1 1 
                               Uniform f32_4* %40 = OpAccessChain %25 %38 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                                        f32_3 %43 = OpFMul %37 %42 
                                        f32_4 %44 = OpLoad %35 
                                        f32_4 %45 = OpVectorShuffle %44 %43 4 5 6 3 
                                                      OpStore %35 %45 
                               Uniform f32_4* %47 = OpAccessChain %25 %38 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 0 0 
                                        f32_3 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %35 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFAdd %52 %54 
                                        f32_4 %56 = OpLoad %35 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 6 3 
                                                      OpStore %35 %57 
                               Uniform f32_4* %59 = OpAccessChain %25 %38 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 2 2 2 
                                        f32_3 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %35 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpFAdd %64 %66 
                                        f32_4 %68 = OpLoad %35 
                                        f32_4 %69 = OpVectorShuffle %68 %67 4 5 6 3 
                                                      OpStore %35 %69 
                                        f32_4 %70 = OpLoad %11 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFNegate %71 
                               Uniform f32_4* %73 = OpAccessChain %25 %27 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFMul %72 %75 
                                        f32_4 %77 = OpLoad %35 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFAdd %76 %78 
                                        f32_4 %80 = OpLoad %35 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %35 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 3 3 3 
                                        f32_4 %85 = OpLoad %35 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFAdd %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                      OpStore %9 %92 
                               Uniform f32_4* %96 = OpAccessChain %25 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                         f32 %101 = OpDot %98 %100 
                                                      OpStore %94 %101 
                                         f32 %102 = OpLoad %94 
                                Uniform f32* %105 = OpAccessChain %25 %95 %103 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpFAdd %102 %106 
                                                      OpStore %94 %107 
                                         f32 %108 = OpLoad %94 
                                       f32_3 %109 = OpCompositeConstruct %108 %108 %108 
                                       f32_3 %110 = OpFNegate %109 
                              Uniform f32_4* %111 = OpAccessChain %25 %95 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %35 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %35 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %35 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %121 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                      OpStore %9 %127 
                                Uniform f32* %129 = OpAccessChain %25 %128 
                                         f32 %130 = OpLoad %129 
                                       f32_3 %131 = OpCompositeConstruct %130 %130 %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %35 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %9 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %9 %139 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %140 1 1 1 1 
                              Uniform f32_4* %142 = OpAccessChain %25 %39 %39 
                                       f32_4 %143 = OpLoad %142 
                                       f32_4 %144 = OpFMul %141 %143 
                                                      OpStore %35 %144 
                              Uniform f32_4* %145 = OpAccessChain %25 %39 %46 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %9 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 0 0 0 
                                       f32_4 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %35 
                                       f32_4 %151 = OpFAdd %149 %150 
                                                      OpStore %35 %151 
                              Uniform f32_4* %152 = OpAccessChain %25 %39 %58 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %35 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                              Uniform f32_4* %161 = OpAccessChain %25 %39 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %159 %162 
                                                      OpStore %9 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %164 1 1 1 1 
                              Uniform f32_4* %167 = OpAccessChain %25 %166 %39 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpFMul %165 %168 
                                                      OpStore %35 %169 
                              Uniform f32_4* %170 = OpAccessChain %25 %166 %46 
                                       f32_4 %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %172 0 0 0 0 
                                       f32_4 %174 = OpFMul %171 %173 
                                       f32_4 %175 = OpLoad %35 
                                       f32_4 %176 = OpFAdd %174 %175 
                                                      OpStore %35 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %166 %58 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_4 %180 = OpVectorShuffle %179 %179 2 2 2 2 
                                       f32_4 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %35 
                                       f32_4 %183 = OpFAdd %181 %182 
                                                      OpStore %35 %183 
                              Uniform f32_4* %189 = OpAccessChain %25 %166 %160 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %191 3 3 3 3 
                                       f32_4 %193 = OpFMul %190 %192 
                                       f32_4 %194 = OpLoad %35 
                                       f32_4 %195 = OpFAdd %193 %194 
                               Output f32_4* %197 = OpAccessChain %188 %46 
                                                      OpStore %197 %195 
                                       f32_4 %202 = OpLoad %201 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                                                      OpStore vs_TEXCOORD0 %203 
                                Private f32* %205 = OpAccessChain %9 %184 
                                         f32 %206 = OpLoad %205 
                                Uniform f32* %208 = OpAccessChain %25 %160 %39 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %206 %209 
                                                      OpStore %204 %210 
                                Uniform f32* %211 = OpAccessChain %25 %160 %46 %207 
                                         f32 %212 = OpLoad %211 
                                Private f32* %214 = OpAccessChain %9 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFMul %212 %215 
                                         f32 %217 = OpLoad %204 
                                         f32 %218 = OpFAdd %216 %217 
                                Private f32* %219 = OpAccessChain %9 %213 
                                                      OpStore %219 %218 
                                Uniform f32* %220 = OpAccessChain %25 %160 %58 %207 
                                         f32 %221 = OpLoad %220 
                                Private f32* %222 = OpAccessChain %9 %207 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %221 %223 
                                Private f32* %225 = OpAccessChain %9 %213 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFAdd %224 %226 
                                Private f32* %228 = OpAccessChain %9 %213 
                                                      OpStore %228 %227 
                                Uniform f32* %229 = OpAccessChain %25 %160 %160 %207 
                                         f32 %230 = OpLoad %229 
                                Private f32* %231 = OpAccessChain %9 %103 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFMul %230 %232 
                                Private f32* %234 = OpAccessChain %9 %213 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFAdd %233 %235 
                                Private f32* %237 = OpAccessChain %9 %213 
                                                      OpStore %237 %236 
                                Private f32* %238 = OpAccessChain %9 %213 
                                         f32 %239 = OpLoad %238 
                                Uniform f32* %240 = OpAccessChain %25 %46 %103 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFMul %239 %241 
                                Private f32* %243 = OpAccessChain %9 %213 
                                                      OpStore %243 %242 
                                Private f32* %245 = OpAccessChain %9 %213 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                 Output f32* %249 = OpAccessChain vs_TEXCOORD1 %103 
                                                      OpStore %249 %247 
                              Uniform f32_4* %250 = OpAccessChain %25 %58 %39 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %25 %253 %46 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 1 1 1 
                                       f32_3 %257 = OpFMul %252 %256 
                                       f32_4 %258 = OpLoad %9 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %9 %259 
                              Uniform f32_4* %260 = OpAccessChain %25 %58 %46 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %25 %253 %46 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 0 0 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_3 %269 = OpFAdd %266 %268 
                                       f32_4 %270 = OpLoad %9 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %9 %271 
                              Uniform f32_4* %272 = OpAccessChain %25 %58 %58 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                              Uniform f32_4* %275 = OpAccessChain %25 %253 %46 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 2 2 2 
                                       f32_3 %278 = OpFMul %274 %277 
                                       f32_4 %279 = OpLoad %9 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpFAdd %278 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %9 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %58 %160 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %253 %46 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 3 3 3 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_4 %291 = OpLoad %9 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_3 %293 = OpFAdd %290 %292 
                                       f32_4 %294 = OpLoad %9 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %9 %295 
                                       f32_4 %296 = OpLoad %9 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                                       f32_3 %300 = OpLoad %299 
                                         f32 %301 = OpDot %297 %300 
                                Private f32* %302 = OpAccessChain %9 %213 
                                                      OpStore %302 %301 
                              Uniform f32_4* %303 = OpAccessChain %25 %58 %39 
                                       f32_4 %304 = OpLoad %303 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                              Uniform f32_4* %306 = OpAccessChain %25 %253 %39 
                                       f32_4 %307 = OpLoad %306 
                                       f32_3 %308 = OpVectorShuffle %307 %307 1 1 1 
                                       f32_3 %309 = OpFMul %305 %308 
                                       f32_4 %310 = OpLoad %35 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 6 3 
                                                      OpStore %35 %311 
                              Uniform f32_4* %312 = OpAccessChain %25 %58 %46 
                                       f32_4 %313 = OpLoad %312 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                              Uniform f32_4* %315 = OpAccessChain %25 %253 %39 
                                       f32_4 %316 = OpLoad %315 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 0 0 
                                       f32_3 %318 = OpFMul %314 %317 
                                       f32_4 %319 = OpLoad %35 
                                       f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                                       f32_3 %321 = OpFAdd %318 %320 
                                       f32_4 %322 = OpLoad %35 
                                       f32_4 %323 = OpVectorShuffle %322 %321 4 5 6 3 
                                                      OpStore %35 %323 
                              Uniform f32_4* %324 = OpAccessChain %25 %58 %58 
                                       f32_4 %325 = OpLoad %324 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                              Uniform f32_4* %327 = OpAccessChain %25 %253 %39 
                                       f32_4 %328 = OpLoad %327 
                                       f32_3 %329 = OpVectorShuffle %328 %328 2 2 2 
                                       f32_3 %330 = OpFMul %326 %329 
                                       f32_4 %331 = OpLoad %35 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %35 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %35 %335 
                              Uniform f32_4* %336 = OpAccessChain %25 %58 %160 
                                       f32_4 %337 = OpLoad %336 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
                              Uniform f32_4* %339 = OpAccessChain %25 %253 %39 
                                       f32_4 %340 = OpLoad %339 
                                       f32_3 %341 = OpVectorShuffle %340 %340 3 3 3 
                                       f32_3 %342 = OpFMul %338 %341 
                                       f32_4 %343 = OpLoad %35 
                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
                                       f32_3 %345 = OpFAdd %342 %344 
                                       f32_4 %346 = OpLoad %35 
                                       f32_4 %347 = OpVectorShuffle %346 %345 4 5 6 3 
                                                      OpStore %35 %347 
                                       f32_4 %348 = OpLoad %35 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 1 2 
                                       f32_3 %350 = OpLoad %299 
                                         f32 %351 = OpDot %349 %350 
                                Private f32* %352 = OpAccessChain %9 %184 
                                                      OpStore %352 %351 
                              Uniform f32_4* %353 = OpAccessChain %25 %58 %39 
                                       f32_4 %354 = OpLoad %353 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                              Uniform f32_4* %356 = OpAccessChain %25 %253 %58 
                                       f32_4 %357 = OpLoad %356 
                                       f32_3 %358 = OpVectorShuffle %357 %357 1 1 1 
                                       f32_3 %359 = OpFMul %355 %358 
                                       f32_4 %360 = OpLoad %35 
                                       f32_4 %361 = OpVectorShuffle %360 %359 4 5 6 3 
                                                      OpStore %35 %361 
                              Uniform f32_4* %362 = OpAccessChain %25 %58 %46 
                                       f32_4 %363 = OpLoad %362 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                              Uniform f32_4* %365 = OpAccessChain %25 %253 %58 
                                       f32_4 %366 = OpLoad %365 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 0 0 
                                       f32_3 %368 = OpFMul %364 %367 
                                       f32_4 %369 = OpLoad %35 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFAdd %368 %370 
                                       f32_4 %372 = OpLoad %35 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %35 %373 
                              Uniform f32_4* %374 = OpAccessChain %25 %58 %58 
                                       f32_4 %375 = OpLoad %374 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                              Uniform f32_4* %377 = OpAccessChain %25 %253 %58 
                                       f32_4 %378 = OpLoad %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 2 2 2 
                                       f32_3 %380 = OpFMul %376 %379 
                                       f32_4 %381 = OpLoad %35 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                       f32_3 %383 = OpFAdd %380 %382 
                                       f32_4 %384 = OpLoad %35 
                                       f32_4 %385 = OpVectorShuffle %384 %383 4 5 6 3 
                                                      OpStore %35 %385 
                              Uniform f32_4* %386 = OpAccessChain %25 %58 %160 
                                       f32_4 %387 = OpLoad %386 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                              Uniform f32_4* %389 = OpAccessChain %25 %253 %58 
                                       f32_4 %390 = OpLoad %389 
                                       f32_3 %391 = OpVectorShuffle %390 %390 3 3 3 
                                       f32_3 %392 = OpFMul %388 %391 
                                       f32_4 %393 = OpLoad %35 
                                       f32_3 %394 = OpVectorShuffle %393 %393 0 1 2 
                                       f32_3 %395 = OpFAdd %392 %394 
                                       f32_4 %396 = OpLoad %35 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 5 6 3 
                                                      OpStore %35 %397 
                                       f32_4 %398 = OpLoad %35 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 1 2 
                                       f32_3 %400 = OpLoad %299 
                                         f32 %401 = OpDot %399 %400 
                                Private f32* %402 = OpAccessChain %9 %207 
                                                      OpStore %402 %401 
                                       f32_4 %403 = OpLoad %9 
                                       f32_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                                       f32_4 %405 = OpLoad %9 
                                       f32_3 %406 = OpVectorShuffle %405 %405 0 1 2 
                                         f32 %407 = OpDot %404 %406 
                                                      OpStore %94 %407 
                                         f32 %408 = OpLoad %94 
                                         f32 %409 = OpExtInst %1 32 %408 
                                                      OpStore %94 %409 
                                         f32 %410 = OpLoad %94 
                                       f32_3 %411 = OpCompositeConstruct %410 %410 %410 
                                       f32_4 %412 = OpLoad %9 
                                       f32_3 %413 = OpVectorShuffle %412 %412 0 1 2 
                                       f32_3 %414 = OpFMul %411 %413 
                                       f32_4 %415 = OpLoad %9 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 6 3 
                                                      OpStore %9 %416 
                                       f32_4 %417 = OpLoad %9 
                                       f32_3 %418 = OpVectorShuffle %417 %417 0 1 2 
                                       f32_3 %419 = OpFNegate %418 
                                       f32_4 %420 = OpLoad vs_TEXCOORD1 
                                       f32_4 %421 = OpVectorShuffle %420 %419 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %421 
                                 Output f32* %422 = OpAccessChain %188 %46 %184 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFNegate %423 
                                 Output f32* %425 = OpAccessChain %188 %46 %184 
                                                      OpStore %425 %424 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 107
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %75 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate vs_TEXCOORD1 Location 61 
                                             OpDecorate %75 Location 75 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypeStruct %6 
                                     %34 = OpTypePointer Uniform %33 
              Uniform struct {f32;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                     %38 = OpTypePointer Uniform %6 
                                     %44 = OpTypeBool 
                                     %45 = OpTypePointer Private %44 
                       Private bool* %46 = OpVariable Private 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 i32 %52 = OpConstant 1 
                                 i32 %54 = OpConstant -1 
                                     %60 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 u32 %62 = OpConstant 2 
                                     %63 = OpTypePointer Input %6 
                                 f32 %66 = OpConstant 3.674022E-40 
                                     %74 = OpTypePointer Output %23 
                       Output f32_4* %75 = OpVariable Output 
                                 f32 %77 = OpConstant 3.674022E-40 
                               f32_2 %78 = OpConstantComposite %77 %77 
                                 f32 %80 = OpConstant 3.674022E-40 
                               f32_2 %81 = OpConstantComposite %80 %80 
                                 f32 %87 = OpConstant 3.674022E-40 
                               f32_2 %88 = OpConstantComposite %66 %87 
                                 u32 %92 = OpConstant 1 
                                 f32 %96 = OpConstant 3.674022E-40 
                                    %101 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFNegate %40 
                                 f32 %42 = OpFAdd %32 %41 
                        Private f32* %43 = OpAccessChain %9 %28 
                                             OpStore %43 %42 
                        Private f32* %47 = OpAccessChain %9 %28 
                                 f32 %48 = OpLoad %47 
                                bool %50 = OpFOrdLessThan %48 %49 
                                             OpStore %46 %50 
                                bool %51 = OpLoad %46 
                                 i32 %53 = OpSelect %51 %52 %37 
                                 i32 %55 = OpIMul %53 %54 
                                bool %56 = OpINotEqual %55 %37 
                                             OpSelectionMerge %58 None 
                                             OpBranchConditional %56 %57 %58 
                                     %57 = OpLabel 
                                             OpKill
                                     %58 = OpLabel 
                          Input f32* %64 = OpAccessChain vs_TEXCOORD1 %62 
                                 f32 %65 = OpLoad %64 
                                 f32 %67 = OpFAdd %65 %66 
                        Private f32* %68 = OpAccessChain %9 %28 
                                             OpStore %68 %67 
                               f32_4 %69 = OpLoad vs_TEXCOORD1 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpLoad %9 
                               f32_2 %72 = OpVectorShuffle %71 %71 0 0 
                               f32_2 %73 = OpFDiv %70 %72 
                                             OpStore %9 %73 
                               f32_2 %76 = OpLoad %9 
                               f32_2 %79 = OpFMul %76 %78 
                               f32_2 %82 = OpFAdd %79 %81 
                               f32_4 %83 = OpLoad %75 
                               f32_4 %84 = OpVectorShuffle %83 %82 4 5 2 3 
                                             OpStore %75 %84 
                               f32_4 %85 = OpLoad vs_TEXCOORD1 
                               f32_2 %86 = OpVectorShuffle %85 %85 3 3 
                               f32_2 %89 = OpFMul %86 %88 
                                             OpStore %9 %89 
                               f32_2 %90 = OpLoad %9 
                               f32_2 %91 = OpExtInst %1 10 %90 
                                             OpStore %9 %91 
                        Private f32* %93 = OpAccessChain %9 %92 
                                 f32 %94 = OpLoad %93 
                                 f32 %95 = OpFNegate %94 
                                 f32 %97 = OpFMul %95 %96 
                        Private f32* %98 = OpAccessChain %9 %28 
                                 f32 %99 = OpLoad %98 
                                f32 %100 = OpFAdd %97 %99 
                        Output f32* %102 = OpAccessChain %75 %62 
                                             OpStore %102 %100 
                       Private f32* %103 = OpAccessChain %9 %92 
                                f32 %104 = OpLoad %103 
                        Output f32* %105 = OpAccessChain %75 %26 
                                             OpStore %105 %104 
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
SubShader {
 Tags { "RenderType" = "TreeBillboard" }
 Pass {
  Tags { "RenderType" = "TreeBillboard" }
  Cull Off
  GpuProgramID 475393
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec3 _TreeBillboardCameraRight;
uniform 	vec4 _TreeBillboardCameraUp;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
    u_xlat1.xy = in_TEXCOORD1.xy;
    u_xlat1.z = in_TEXCOORD0.y;
    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb1 = 0.0<in_TEXCOORD0.y;
    vs_TEXCOORD0.y = u_xlatb1 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    vs_TEXCOORD1.xyz = vec3(0.0, 0.0, 1.0);
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
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + -0.00100000005;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 266
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %54 %58 %192 %207 %253 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %58 Location 58 
                                                      OpMemberDecorate %190 0 BuiltIn 190 
                                                      OpMemberDecorate %190 1 BuiltIn 190 
                                                      OpMemberDecorate %190 2 BuiltIn 190 
                                                      OpDecorate %190 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 207 
                                                      OpDecorate vs_TEXCOORD1 Location 253 
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
                                              %20 = OpTypeStruct %7 %17 %18 %19 %12 %7 %7 %7 %7 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_3; f32_4; f32_4; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 7 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %38 = OpConstant 0 
                                              %39 = OpTypePointer Private %6 
                                              %41 = OpTypeBool 
                                              %42 = OpTypePointer Private %41 
                                Private bool* %43 = OpVariable Private 
                                          i32 %44 = OpConstant 8 
                                              %45 = OpTypePointer Uniform %6 
                               Private f32_4* %51 = OpVariable Private 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Input %52 
                                 Input f32_2* %54 = OpVariable Input 
                                 Input f32_4* %58 = OpVariable Input 
                                          u32 %59 = OpConstant 1 
                                              %60 = OpTypePointer Input %6 
                                          u32 %63 = OpConstant 2 
                                              %66 = OpTypePointer Function %12 
                                          f32 %70 = OpConstant 3.674022E-40 
                                        f32_3 %71 = OpConstantComposite %70 %70 %70 
                                 Private f32* %78 = OpVariable Private 
                                 Private f32* %85 = OpVariable Private 
                                          u32 %86 = OpConstant 3 
                                          i32 %94 = OpConstant 4 
                                         i32 %113 = OpConstant 6 
                                         i32 %120 = OpConstant 5 
                                         i32 %145 = OpConstant 1 
                                         i32 %149 = OpConstant 0 
                                         i32 %157 = OpConstant 2 
                                         i32 %166 = OpConstant 3 
                                             %189 = OpTypeArray %6 %59 
                                             %190 = OpTypeStruct %7 %6 %189 
                                             %191 = OpTypePointer Output %190 
        Output struct {f32_4; f32; f32[1];}* %192 = OpVariable Output 
                                             %200 = OpTypePointer Output %7 
                               Private bool* %202 = OpVariable Private 
                                             %206 = OpTypePointer Output %52 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                         f32 %209 = OpConstant 3.674022E-40 
                                             %211 = OpTypePointer Output %6 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                       f32_3 %258 = OpConstantComposite %70 %70 %209 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %67 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFNegate %28 
                                        f32_3 %30 = OpFAdd %14 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 6 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_4 %35 = OpLoad %9 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                          f32 %37 = OpDot %34 %36 
                                 Private f32* %40 = OpAccessChain %9 %38 
                                                      OpStore %40 %37 
                                 Uniform f32* %46 = OpAccessChain %22 %44 %38 
                                          f32 %47 = OpLoad %46 
                                 Private f32* %48 = OpAccessChain %9 %38 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdLessThan %47 %49 
                                                      OpStore %43 %50 
                                        f32_2 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %51 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
                                                      OpStore %51 %57 
                                   Input f32* %61 = OpAccessChain %58 %59 
                                          f32 %62 = OpLoad %61 
                                 Private f32* %64 = OpAccessChain %51 %63 
                                                      OpStore %64 %62 
                                         bool %65 = OpLoad %43 
                                                      OpSelectionMerge %69 None 
                                                      OpBranchConditional %65 %68 %72 
                                              %68 = OpLabel 
                                                      OpStore %67 %71 
                                                      OpBranch %69 
                                              %72 = OpLabel 
                                        f32_4 %73 = OpLoad %51 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                                      OpStore %67 %74 
                                                      OpBranch %69 
                                              %69 = OpLabel 
                                        f32_3 %75 = OpLoad %67 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                                 Private f32* %79 = OpAccessChain %9 %59 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                 Private f32* %82 = OpAccessChain %9 %63 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFAdd %81 %83 
                                                      OpStore %78 %84 
                                 Uniform f32* %87 = OpAccessChain %22 %24 %86 
                                          f32 %88 = OpLoad %87 
                                          f32 %89 = OpLoad %78 
                                          f32 %90 = OpFMul %88 %89 
                                 Private f32* %91 = OpAccessChain %9 %59 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpFAdd %90 %92 
                                                      OpStore %85 %93 
                                 Uniform f32* %95 = OpAccessChain %22 %94 %38 
                                          f32 %96 = OpLoad %95 
                                 Uniform f32* %97 = OpAccessChain %22 %94 %59 
                                          f32 %98 = OpLoad %97 
                                 Uniform f32* %99 = OpAccessChain %22 %94 %63 
                                         f32 %100 = OpLoad %99 
                                       f32_3 %101 = OpCompositeConstruct %96 %98 %100 
                                       f32_4 %102 = OpLoad %9 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 0 0 
                                       f32_3 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %11 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                       f32_4 %108 = OpLoad %51 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %51 %109 
                                       f32_4 %110 = OpLoad %9 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 0 0 
                                       f32_3 %112 = OpExtInst %1 4 %111 
                              Uniform f32_4* %114 = OpAccessChain %22 %113 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFMul %112 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 1 5 6 
                                                      OpStore %9 %119 
                              Uniform f32_4* %121 = OpAccessChain %22 %120 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpLoad %85 
                                       f32_3 %125 = OpCompositeConstruct %124 %124 %124 
                                       f32_3 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %51 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %51 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %51 %131 
                                       f32_4 %132 = OpLoad %9 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 2 3 
                              Uniform f32_4* %134 = OpAccessChain %22 %120 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 3 3 3 
                                       f32_3 %137 = OpFMul %133 %136 
                                       f32_4 %138 = OpLoad %51 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %137 %139 
                                       f32_4 %141 = OpLoad %9 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %9 %142 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %22 %145 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %144 %147 
                                                      OpStore %51 %148 
                              Uniform f32_4* %150 = OpAccessChain %22 %145 %149 
                                       f32_4 %151 = OpLoad %150 
                                       f32_4 %152 = OpLoad %9 
                                       f32_4 %153 = OpVectorShuffle %152 %152 0 0 0 0 
                                       f32_4 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %51 
                                       f32_4 %156 = OpFAdd %154 %155 
                                                      OpStore %51 %156 
                              Uniform f32_4* %158 = OpAccessChain %22 %145 %157 
                                       f32_4 %159 = OpLoad %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %160 2 2 2 2 
                                       f32_4 %162 = OpFMul %159 %161 
                                       f32_4 %163 = OpLoad %51 
                                       f32_4 %164 = OpFAdd %162 %163 
                                                      OpStore %9 %164 
                                       f32_4 %165 = OpLoad %9 
                              Uniform f32_4* %167 = OpAccessChain %22 %145 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpFAdd %165 %168 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %172 = OpAccessChain %22 %166 %145 
                                       f32_4 %173 = OpLoad %172 
                                       f32_4 %174 = OpFMul %171 %173 
                                                      OpStore %51 %174 
                              Uniform f32_4* %175 = OpAccessChain %22 %166 %149 
                                       f32_4 %176 = OpLoad %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %177 0 0 0 0 
                                       f32_4 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %51 
                                       f32_4 %181 = OpFAdd %179 %180 
                                                      OpStore %51 %181 
                              Uniform f32_4* %182 = OpAccessChain %22 %166 %157 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_4 %185 = OpVectorShuffle %184 %184 2 2 2 2 
                                       f32_4 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %51 
                                       f32_4 %188 = OpFAdd %186 %187 
                                                      OpStore %51 %188 
                              Uniform f32_4* %193 = OpAccessChain %22 %166 %166 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpVectorShuffle %195 %195 3 3 3 3 
                                       f32_4 %197 = OpFMul %194 %196 
                                       f32_4 %198 = OpLoad %51 
                                       f32_4 %199 = OpFAdd %197 %198 
                               Output f32_4* %201 = OpAccessChain %192 %149 
                                                      OpStore %201 %199 
                                  Input f32* %203 = OpAccessChain %58 %59 
                                         f32 %204 = OpLoad %203 
                                        bool %205 = OpFOrdLessThan %70 %204 
                                                      OpStore %202 %205 
                                        bool %208 = OpLoad %202 
                                         f32 %210 = OpSelect %208 %209 %70 
                                 Output f32* %212 = OpAccessChain vs_TEXCOORD0 %59 
                                                      OpStore %212 %210 
                                  Input f32* %213 = OpAccessChain %58 %38 
                                         f32 %214 = OpLoad %213 
                                 Output f32* %215 = OpAccessChain vs_TEXCOORD0 %38 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %9 %59 
                                         f32 %217 = OpLoad %216 
                                Uniform f32* %218 = OpAccessChain %22 %157 %145 %63 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %217 %219 
                                                      OpStore %85 %220 
                                Uniform f32* %221 = OpAccessChain %22 %157 %149 %63 
                                         f32 %222 = OpLoad %221 
                                Private f32* %223 = OpAccessChain %9 %38 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %222 %224 
                                         f32 %226 = OpLoad %85 
                                         f32 %227 = OpFAdd %225 %226 
                                Private f32* %228 = OpAccessChain %9 %38 
                                                      OpStore %228 %227 
                                Uniform f32* %229 = OpAccessChain %22 %157 %157 %63 
                                         f32 %230 = OpLoad %229 
                                Private f32* %231 = OpAccessChain %9 %63 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFMul %230 %232 
                                Private f32* %234 = OpAccessChain %9 %38 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFAdd %233 %235 
                                Private f32* %237 = OpAccessChain %9 %38 
                                                      OpStore %237 %236 
                                Uniform f32* %238 = OpAccessChain %22 %157 %166 %63 
                                         f32 %239 = OpLoad %238 
                                Private f32* %240 = OpAccessChain %9 %86 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFMul %239 %241 
                                Private f32* %243 = OpAccessChain %9 %38 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFAdd %242 %244 
                                Private f32* %246 = OpAccessChain %9 %38 
                                                      OpStore %246 %245 
                                Private f32* %247 = OpAccessChain %9 %38 
                                         f32 %248 = OpLoad %247 
                                Uniform f32* %249 = OpAccessChain %22 %149 %86 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFMul %248 %250 
                                Private f32* %252 = OpAccessChain %9 %38 
                                                      OpStore %252 %251 
                                Private f32* %254 = OpAccessChain %9 %38 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFNegate %255 
                                 Output f32* %257 = OpAccessChain vs_TEXCOORD1 %86 
                                                      OpStore %257 %256 
                                       f32_4 %259 = OpLoad vs_TEXCOORD1 
                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %260 
                                 Output f32* %261 = OpAccessChain %192 %149 %59 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFNegate %262 
                                 Output f32* %264 = OpAccessChain %192 %149 %59 
                                                      OpStore %264 %263 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 101
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %55 %69 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate vs_TEXCOORD1 Location 55 
                                             OpDecorate %69 Location 69 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                 f32 %33 = OpConstant 3.674022E-40 
                                     %36 = OpTypeBool 
                                     %37 = OpTypePointer Private %36 
                       Private bool* %38 = OpVariable Private 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %44 = OpTypeInt 32 1 
                                 i32 %45 = OpConstant 0 
                                 i32 %46 = OpConstant 1 
                                 i32 %48 = OpConstant -1 
                                     %54 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 u32 %56 = OpConstant 2 
                                     %57 = OpTypePointer Input %6 
                                 f32 %60 = OpConstant 3.674022E-40 
                                     %68 = OpTypePointer Output %23 
                       Output f32_4* %69 = OpVariable Output 
                                 f32 %71 = OpConstant 3.674022E-40 
                               f32_2 %72 = OpConstantComposite %71 %71 
                                 f32 %74 = OpConstant 3.674022E-40 
                               f32_2 %75 = OpConstantComposite %74 %74 
                                 f32 %81 = OpConstant 3.674022E-40 
                               f32_2 %82 = OpConstantComposite %60 %81 
                                 u32 %86 = OpConstant 1 
                                 f32 %90 = OpConstant 3.674022E-40 
                                     %95 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                                 f32 %34 = OpFAdd %32 %33 
                        Private f32* %35 = OpAccessChain %9 %28 
                                             OpStore %35 %34 
                        Private f32* %39 = OpAccessChain %9 %28 
                                 f32 %40 = OpLoad %39 
                                bool %42 = OpFOrdLessThan %40 %41 
                                             OpStore %38 %42 
                                bool %43 = OpLoad %38 
                                 i32 %47 = OpSelect %43 %46 %45 
                                 i32 %49 = OpIMul %47 %48 
                                bool %50 = OpINotEqual %49 %45 
                                             OpSelectionMerge %52 None 
                                             OpBranchConditional %50 %51 %52 
                                     %51 = OpLabel 
                                             OpKill
                                     %52 = OpLabel 
                          Input f32* %58 = OpAccessChain vs_TEXCOORD1 %56 
                                 f32 %59 = OpLoad %58 
                                 f32 %61 = OpFAdd %59 %60 
                        Private f32* %62 = OpAccessChain %9 %28 
                                             OpStore %62 %61 
                               f32_4 %63 = OpLoad vs_TEXCOORD1 
                               f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                               f32_2 %65 = OpLoad %9 
                               f32_2 %66 = OpVectorShuffle %65 %65 0 0 
                               f32_2 %67 = OpFDiv %64 %66 
                                             OpStore %9 %67 
                               f32_2 %70 = OpLoad %9 
                               f32_2 %73 = OpFMul %70 %72 
                               f32_2 %76 = OpFAdd %73 %75 
                               f32_4 %77 = OpLoad %69 
                               f32_4 %78 = OpVectorShuffle %77 %76 4 5 2 3 
                                             OpStore %69 %78 
                               f32_4 %79 = OpLoad vs_TEXCOORD1 
                               f32_2 %80 = OpVectorShuffle %79 %79 3 3 
                               f32_2 %83 = OpFMul %80 %82 
                                             OpStore %9 %83 
                               f32_2 %84 = OpLoad %9 
                               f32_2 %85 = OpExtInst %1 10 %84 
                                             OpStore %9 %85 
                        Private f32* %87 = OpAccessChain %9 %86 
                                 f32 %88 = OpLoad %87 
                                 f32 %89 = OpFNegate %88 
                                 f32 %91 = OpFMul %89 %90 
                        Private f32* %92 = OpAccessChain %9 %28 
                                 f32 %93 = OpLoad %92 
                                 f32 %94 = OpFAdd %91 %93 
                         Output f32* %96 = OpAccessChain %69 %56 
                                             OpStore %96 %94 
                        Private f32* %97 = OpAccessChain %9 %86 
                                 f32 %98 = OpLoad %97 
                         Output f32* %99 = OpAccessChain %69 %26 
                                             OpStore %99 %98 
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
SubShader {
 Tags { "RenderType" = "GrassBillboard" }
 Pass {
  Tags { "RenderType" = "GrassBillboard" }
  Cull Off
  GpuProgramID 573702
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
uniform 	vec3 _CameraRight;
uniform 	vec3 _CameraUp;
in  vec4 in_POSITION0;
in  vec4 in_TANGENT0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_CameraPosition.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb0 = _WaveAndDistance.w<u_xlat0.x;
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
    u_xlat0.xzw = u_xlat0.xxx * _CameraRight.xyz + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.yyy * _CameraUp.xyz + u_xlat0.xzw;
    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat2 = u_xlat1 * u_xlat1;
    u_xlat3 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
    u_xlat3 = u_xlat2 * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
    u_xlat12 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat12 = u_xlat12 * 0.699999988;
    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
    u_xlat4 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4 = (-u_xlat4) + _WaveAndDistance.w;
    vs_COLOR0.w = dot(_CameraPosition.ww, vec2(u_xlat4));
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat0.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz * in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w * vs_COLOR0.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 565
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %63 %242 %301 %331 %345 %346 %388 %442 
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
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %242 Location 242 
                                                      OpMemberDecorate %299 0 BuiltIn 299 
                                                      OpMemberDecorate %299 1 BuiltIn 299 
                                                      OpMemberDecorate %299 2 BuiltIn 299 
                                                      OpDecorate %299 Block 
                                                      OpDecorate %331 Location 331 
                                                      OpDecorate vs_TEXCOORD0 Location 345 
                                                      OpDecorate %346 Location 346 
                                                      OpDecorate vs_TEXCOORD1 Location 388 
                                                      OpDecorate %442 Location 442 
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
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeStruct %7 %17 %18 %19 %20 %21 %7 %7 %7 %12 %12 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_3; f32_3;}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 8 
                                              %27 = OpTypePointer Uniform %7 
                                          u32 %40 = OpConstant 0 
                                              %41 = OpTypePointer Private %6 
                                              %43 = OpTypeBool 
                                              %44 = OpTypePointer Private %43 
                                Private bool* %45 = OpVariable Private 
                                          i32 %46 = OpConstant 7 
                                          u32 %47 = OpConstant 3 
                                              %48 = OpTypePointer Uniform %6 
                                              %55 = OpTypeVector %6 2 
                                              %56 = OpTypePointer Function %55 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_2 %61 = OpConstantComposite %60 %60 
                                 Input f32_4* %63 = OpVariable Input 
                                          i32 %71 = OpConstant 9 
                                              %72 = OpTypePointer Uniform %12 
                                          i32 %83 = OpConstant 10 
                               Private f32_4* %92 = OpVariable Private 
                              Private f32_4* %101 = OpVariable Private 
                                         f32 %104 = OpConstant 3.674022E-40 
                                         f32 %105 = OpConstant 3.674022E-40 
                                         f32 %106 = OpConstant 3.674022E-40 
                                       f32_4 %107 = OpConstantComposite %104 %105 %105 %106 
                                         f32 %111 = OpConstant 3.674022E-40 
                                         f32 %112 = OpConstant 3.674022E-40 
                                         f32 %113 = OpConstant 3.674022E-40 
                                       f32_4 %114 = OpConstantComposite %111 %105 %112 %113 
                                         f32 %121 = OpConstant 3.674022E-40 
                                         f32 %122 = OpConstant 3.674022E-40 
                                         f32 %123 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                                       f32_4 %125 = OpConstantComposite %121 %122 %123 %124 
                                         f32 %132 = OpConstant 3.674022E-40 
                                       f32_4 %133 = OpConstantComposite %132 %132 %132 %132 
                                         f32 %135 = OpConstant 3.674022E-40 
                                       f32_4 %136 = OpConstantComposite %135 %135 %135 %135 
                              Private f32_4* %141 = OpVariable Private 
                                         f32 %146 = OpConstant 3.674022E-40 
                                       f32_4 %147 = OpConstantComposite %146 %146 %146 %146 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %164 = OpConstant 3.674022E-40 
                                       f32_4 %165 = OpConstantComposite %164 %164 %164 %164 
                                Private f32* %179 = OpVariable Private 
                                         f32 %181 = OpConstant 3.674022E-40 
                                         f32 %182 = OpConstant 3.674022E-40 
                                         f32 %183 = OpConstant 3.674022E-40 
                                       f32_4 %184 = OpConstantComposite %181 %181 %182 %183 
                                         f32 %187 = OpConstant 3.674022E-40 
                                         f32 %190 = OpConstant 3.674022E-40 
                                         f32 %191 = OpConstant 3.674022E-40 
                                         f32 %192 = OpConstant 3.674022E-40 
                                       f32_4 %193 = OpConstantComposite %113 %190 %191 %192 
                                         f32 %197 = OpConstant 3.674022E-40 
                                         f32 %198 = OpConstant 3.674022E-40 
                                       f32_4 %199 = OpConstantComposite %104 %105 %197 %198 
                                         u32 %201 = OpConstant 2 
                                         i32 %217 = OpConstant 1 
                                Private f32* %230 = OpVariable Private 
                                             %241 = OpTypePointer Output %7 
                               Output f32_4* %242 = OpVariable Output 
                                             %249 = OpTypePointer Output %6 
                                         f32 %253 = OpConstant 3.674022E-40 
                                         i32 %256 = OpConstant 0 
                                         i32 %264 = OpConstant 2 
                                         i32 %273 = OpConstant 3 
                                         i32 %279 = OpConstant 5 
                                         u32 %297 = OpConstant 1 
                                             %298 = OpTypeArray %6 %297 
                                             %299 = OpTypeStruct %7 %6 %298 
                                             %300 = OpTypePointer Output %299 
        Output struct {f32_4; f32; f32[1];}* %301 = OpVariable Output 
                                         i32 %310 = OpConstant 6 
                                         f32 %314 = OpConstant 3.674022E-40 
                                       f32_3 %315 = OpConstantComposite %314 %314 %314 
                                         f32 %324 = OpConstant 3.674022E-40 
                                       f32_3 %325 = OpConstantComposite %324 %324 %324 
                                Input f32_4* %331 = OpVariable Input 
                                             %344 = OpTypePointer Output %55 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %346 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %396 = OpConstant 4 
                                             %441 = OpTypePointer Input %12 
                                Input f32_3* %442 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_2* %57 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %28 = OpAccessChain %24 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                                        f32_3 %31 = OpFNegate %30 
                                        f32_3 %32 = OpFAdd %14 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpVectorShuffle %33 %32 4 5 6 3 
                                                      OpStore %9 %34 
                                        f32_4 %35 = OpLoad %9 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_4 %37 = OpLoad %9 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                          f32 %39 = OpDot %36 %38 
                                 Private f32* %42 = OpAccessChain %9 %40 
                                                      OpStore %42 %39 
                                 Uniform f32* %49 = OpAccessChain %24 %46 %47 
                                          f32 %50 = OpLoad %49 
                                 Private f32* %51 = OpAccessChain %9 %40 
                                          f32 %52 = OpLoad %51 
                                         bool %53 = OpFOrdLessThan %50 %52 
                                                      OpStore %45 %53 
                                         bool %54 = OpLoad %45 
                                                      OpSelectionMerge %59 None 
                                                      OpBranchConditional %54 %58 %62 
                                              %58 = OpLabel 
                                                      OpStore %57 %61 
                                                      OpBranch %59 
                                              %62 = OpLabel 
                                        f32_4 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                                      OpStore %57 %65 
                                                      OpBranch %59 
                                              %59 = OpLabel 
                                        f32_2 %66 = OpLoad %57 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 2 3 
                                                      OpStore %9 %68 
                                        f32_4 %69 = OpLoad %9 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
                               Uniform f32_3* %73 = OpAccessChain %24 %71 
                                        f32_3 %74 = OpLoad %73 
                                        f32_3 %75 = OpFMul %70 %74 
                                        f32_4 %76 = OpLoad %11 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 1 5 6 
                                                      OpStore %9 %80 
                                        f32_4 %81 = OpLoad %9 
                                        f32_3 %82 = OpVectorShuffle %81 %81 1 1 1 
                               Uniform f32_3* %84 = OpAccessChain %24 %83 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpFMul %82 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 2 3 
                                        f32_3 %89 = OpFAdd %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                                      OpStore %9 %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 2 
                               Uniform f32_4* %95 = OpAccessChain %24 %46 
                                        f32_4 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 1 1 
                                        f32_2 %98 = OpFMul %94 %97 
                                        f32_4 %99 = OpLoad %92 
                                       f32_4 %100 = OpVectorShuffle %99 %98 4 5 2 3 
                                                      OpStore %92 %100 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                                       f32_4 %108 = OpFMul %103 %107 
                                                      OpStore %101 %108 
                                       f32_4 %109 = OpLoad %92 
                                       f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
                                       f32_4 %115 = OpFMul %110 %114 
                                       f32_4 %116 = OpLoad %101 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %92 %117 
                              Uniform f32_4* %118 = OpAccessChain %24 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpVectorShuffle %119 %119 0 0 0 0 
                                       f32_4 %126 = OpFMul %120 %125 
                                       f32_4 %127 = OpLoad %92 
                                       f32_4 %128 = OpFAdd %126 %127 
                                                      OpStore %92 %128 
                                       f32_4 %129 = OpLoad %92 
                                       f32_4 %130 = OpExtInst %1 10 %129 
                                                      OpStore %92 %130 
                                       f32_4 %131 = OpLoad %92 
                                       f32_4 %134 = OpFMul %131 %133 
                                       f32_4 %137 = OpFAdd %134 %136 
                                                      OpStore %92 %137 
                                       f32_4 %138 = OpLoad %92 
                                       f32_4 %139 = OpLoad %92 
                                       f32_4 %140 = OpFMul %138 %139 
                                                      OpStore %101 %140 
                                       f32_4 %142 = OpLoad %92 
                                       f32_4 %143 = OpLoad %101 
                                       f32_4 %144 = OpFMul %142 %143 
                                                      OpStore %141 %144 
                                       f32_4 %145 = OpLoad %141 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %92 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %92 %150 
                                       f32_4 %151 = OpLoad %101 
                                       f32_4 %152 = OpLoad %141 
                                       f32_4 %153 = OpFMul %151 %152 
                                                      OpStore %141 %153 
                                       f32_4 %154 = OpLoad %101 
                                       f32_4 %155 = OpLoad %141 
                                       f32_4 %156 = OpFMul %154 %155 
                                                      OpStore %101 %156 
                                       f32_4 %157 = OpLoad %141 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %92 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %92 %162 
                                       f32_4 %163 = OpLoad %101 
                                       f32_4 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %92 
                                       f32_4 %168 = OpFAdd %166 %167 
                                                      OpStore %92 %168 
                                       f32_4 %169 = OpLoad %92 
                                       f32_4 %170 = OpLoad %92 
                                       f32_4 %171 = OpFMul %169 %170 
                                                      OpStore %92 %171 
                                       f32_4 %172 = OpLoad %92 
                                       f32_4 %173 = OpLoad %92 
                                       f32_4 %174 = OpFMul %172 %173 
                                                      OpStore %92 %174 
                                       f32_4 %175 = OpLoad %92 
                                       f32_4 %176 = OpLoad %63 
                                       f32_4 %177 = OpVectorShuffle %176 %176 1 1 1 1 
                                       f32_4 %178 = OpFMul %175 %177 
                                                      OpStore %101 %178 
                                       f32_4 %180 = OpLoad %92 
                                         f32 %185 = OpDot %180 %184 
                                                      OpStore %179 %185 
                                         f32 %186 = OpLoad %179 
                                         f32 %188 = OpFMul %186 %187 
                                                      OpStore %179 %188 
                                       f32_4 %189 = OpLoad %101 
                                         f32 %194 = OpDot %189 %193 
                                Private f32* %195 = OpAccessChain %92 %40 
                                                      OpStore %195 %194 
                                       f32_4 %196 = OpLoad %101 
                                         f32 %200 = OpDot %196 %199 
                                Private f32* %202 = OpAccessChain %92 %201 
                                                      OpStore %202 %200 
                                       f32_4 %203 = OpLoad %92 
                                       f32_2 %204 = OpVectorShuffle %203 %203 0 2 
                                       f32_2 %205 = OpFNegate %204 
                              Uniform f32_4* %206 = OpAccessChain %24 %46 
                                       f32_4 %207 = OpLoad %206 
                                       f32_2 %208 = OpVectorShuffle %207 %207 2 2 
                                       f32_2 %209 = OpFMul %205 %208 
                                       f32_4 %210 = OpLoad %9 
                                       f32_2 %211 = OpVectorShuffle %210 %210 0 2 
                                       f32_2 %212 = OpFAdd %209 %211 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 1 5 3 
                                                      OpStore %9 %214 
                                       f32_4 %215 = OpLoad %9 
                                       f32_4 %216 = OpVectorShuffle %215 %215 1 1 1 1 
                              Uniform f32_4* %218 = OpAccessChain %24 %217 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpFMul %216 %219 
                                                      OpStore %92 %220 
                                       f32_4 %221 = OpLoad %9 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                              Uniform f32_4* %223 = OpAccessChain %24 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_3 %227 = OpFAdd %222 %226 
                                       f32_4 %228 = OpLoad %101 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %101 %229 
                                       f32_4 %231 = OpLoad %101 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_4 %233 = OpLoad %101 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                         f32 %235 = OpDot %232 %234 
                                                      OpStore %230 %235 
                                         f32 %236 = OpLoad %230 
                                         f32 %237 = OpFNegate %236 
                                Uniform f32* %238 = OpAccessChain %24 %46 %47 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFAdd %237 %239 
                                                      OpStore %230 %240 
                              Uniform f32_4* %243 = OpAccessChain %24 %26 
                                       f32_4 %244 = OpLoad %243 
                                       f32_2 %245 = OpVectorShuffle %244 %244 3 3 
                                         f32 %246 = OpLoad %230 
                                       f32_2 %247 = OpCompositeConstruct %246 %246 
                                         f32 %248 = OpDot %245 %247 
                                 Output f32* %250 = OpAccessChain %242 %47 
                                                      OpStore %250 %248 
                                 Output f32* %251 = OpAccessChain %242 %47 
                                         f32 %252 = OpLoad %251 
                                         f32 %254 = OpExtInst %1 43 %252 %60 %253 
                                 Output f32* %255 = OpAccessChain %242 %47 
                                                      OpStore %255 %254 
                              Uniform f32_4* %257 = OpAccessChain %24 %217 %256 
                                       f32_4 %258 = OpLoad %257 
                                       f32_4 %259 = OpLoad %9 
                                       f32_4 %260 = OpVectorShuffle %259 %259 0 0 0 0 
                                       f32_4 %261 = OpFMul %258 %260 
                                       f32_4 %262 = OpLoad %92 
                                       f32_4 %263 = OpFAdd %261 %262 
                                                      OpStore %92 %263 
                              Uniform f32_4* %265 = OpAccessChain %24 %217 %264 
                                       f32_4 %266 = OpLoad %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %267 2 2 2 2 
                                       f32_4 %269 = OpFMul %266 %268 
                                       f32_4 %270 = OpLoad %92 
                                       f32_4 %271 = OpFAdd %269 %270 
                                                      OpStore %92 %271 
                                       f32_4 %272 = OpLoad %92 
                              Uniform f32_4* %274 = OpAccessChain %24 %217 %273 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpFAdd %272 %275 
                                                      OpStore %92 %276 
                                       f32_4 %277 = OpLoad %92 
                                       f32_4 %278 = OpVectorShuffle %277 %277 1 1 1 1 
                              Uniform f32_4* %280 = OpAccessChain %24 %279 %217 
                                       f32_4 %281 = OpLoad %280 
                                       f32_4 %282 = OpFMul %278 %281 
                                                      OpStore %101 %282 
                              Uniform f32_4* %283 = OpAccessChain %24 %279 %256 
                                       f32_4 %284 = OpLoad %283 
                                       f32_4 %285 = OpLoad %92 
                                       f32_4 %286 = OpVectorShuffle %285 %285 0 0 0 0 
                                       f32_4 %287 = OpFMul %284 %286 
                                       f32_4 %288 = OpLoad %101 
                                       f32_4 %289 = OpFAdd %287 %288 
                                                      OpStore %101 %289 
                              Uniform f32_4* %290 = OpAccessChain %24 %279 %264 
                                       f32_4 %291 = OpLoad %290 
                                       f32_4 %292 = OpLoad %92 
                                       f32_4 %293 = OpVectorShuffle %292 %292 2 2 2 2 
                                       f32_4 %294 = OpFMul %291 %293 
                                       f32_4 %295 = OpLoad %101 
                                       f32_4 %296 = OpFAdd %294 %295 
                                                      OpStore %101 %296 
                              Uniform f32_4* %302 = OpAccessChain %24 %279 %273 
                                       f32_4 %303 = OpLoad %302 
                                       f32_4 %304 = OpLoad %92 
                                       f32_4 %305 = OpVectorShuffle %304 %304 3 3 3 3 
                                       f32_4 %306 = OpFMul %303 %305 
                                       f32_4 %307 = OpLoad %101 
                                       f32_4 %308 = OpFAdd %306 %307 
                               Output f32_4* %309 = OpAccessChain %301 %256 
                                                      OpStore %309 %308 
                              Uniform f32_4* %311 = OpAccessChain %24 %310 
                                       f32_4 %312 = OpLoad %311 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                       f32_3 %316 = OpFAdd %313 %315 
                                       f32_4 %317 = OpLoad %9 
                                       f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                                      OpStore %9 %318 
                                         f32 %319 = OpLoad %179 
                                       f32_3 %320 = OpCompositeConstruct %319 %319 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
                                       f32_3 %323 = OpFMul %320 %322 
                                       f32_3 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
                                                      OpStore %9 %328 
                                       f32_4 %329 = OpLoad %9 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
                                       f32_4 %332 = OpLoad %331 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFMul %330 %333 
                                       f32_4 %335 = OpLoad %9 
                                       f32_4 %336 = OpVectorShuffle %335 %334 4 5 6 3 
                                                      OpStore %9 %336 
                                       f32_4 %337 = OpLoad %9 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
                                       f32_4 %339 = OpLoad %9 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
                                       f32_3 %341 = OpFAdd %338 %340 
                                       f32_4 %342 = OpLoad %242 
                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 6 3 
                                                      OpStore %242 %343 
                                       f32_4 %347 = OpLoad %346 
                                       f32_2 %348 = OpVectorShuffle %347 %347 0 1 
                                                      OpStore vs_TEXCOORD0 %348 
                                Private f32* %349 = OpAccessChain %92 %297 
                                         f32 %350 = OpLoad %349 
                                Uniform f32* %351 = OpAccessChain %24 %273 %217 %201 
                                         f32 %352 = OpLoad %351 
                                         f32 %353 = OpFMul %350 %352 
                                Private f32* %354 = OpAccessChain %9 %40 
                                                      OpStore %354 %353 
                                Uniform f32* %355 = OpAccessChain %24 %273 %256 %201 
                                         f32 %356 = OpLoad %355 
                                Private f32* %357 = OpAccessChain %92 %40 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFMul %356 %358 
                                Private f32* %360 = OpAccessChain %9 %40 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFAdd %359 %361 
                                Private f32* %363 = OpAccessChain %9 %40 
                                                      OpStore %363 %362 
                                Uniform f32* %364 = OpAccessChain %24 %273 %264 %201 
                                         f32 %365 = OpLoad %364 
                                Private f32* %366 = OpAccessChain %92 %201 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFMul %365 %367 
                                Private f32* %369 = OpAccessChain %9 %40 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFAdd %368 %370 
                                Private f32* %372 = OpAccessChain %9 %40 
                                                      OpStore %372 %371 
                                Uniform f32* %373 = OpAccessChain %24 %273 %273 %201 
                                         f32 %374 = OpLoad %373 
                                Private f32* %375 = OpAccessChain %92 %47 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFMul %374 %376 
                                Private f32* %378 = OpAccessChain %9 %40 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFAdd %377 %379 
                                Private f32* %381 = OpAccessChain %9 %40 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %9 %40 
                                         f32 %383 = OpLoad %382 
                                Uniform f32* %384 = OpAccessChain %24 %256 %47 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpFMul %383 %385 
                                Private f32* %387 = OpAccessChain %9 %40 
                                                      OpStore %387 %386 
                                Private f32* %389 = OpAccessChain %9 %40 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFNegate %390 
                                 Output f32* %392 = OpAccessChain vs_TEXCOORD1 %47 
                                                      OpStore %392 %391 
                              Uniform f32_4* %393 = OpAccessChain %24 %264 %217 
                                       f32_4 %394 = OpLoad %393 
                                       f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                              Uniform f32_4* %397 = OpAccessChain %24 %396 %256 
                                       f32_4 %398 = OpLoad %397 
                                       f32_3 %399 = OpVectorShuffle %398 %398 1 1 1 
                                       f32_3 %400 = OpFMul %395 %399 
                                       f32_4 %401 = OpLoad %9 
                                       f32_4 %402 = OpVectorShuffle %401 %400 4 5 6 3 
                                                      OpStore %9 %402 
                              Uniform f32_4* %403 = OpAccessChain %24 %264 %256 
                                       f32_4 %404 = OpLoad %403 
                                       f32_3 %405 = OpVectorShuffle %404 %404 0 1 2 
                              Uniform f32_4* %406 = OpAccessChain %24 %396 %256 
                                       f32_4 %407 = OpLoad %406 
                                       f32_3 %408 = OpVectorShuffle %407 %407 0 0 0 
                                       f32_3 %409 = OpFMul %405 %408 
                                       f32_4 %410 = OpLoad %9 
                                       f32_3 %411 = OpVectorShuffle %410 %410 0 1 2 
                                       f32_3 %412 = OpFAdd %409 %411 
                                       f32_4 %413 = OpLoad %9 
                                       f32_4 %414 = OpVectorShuffle %413 %412 4 5 6 3 
                                                      OpStore %9 %414 
                              Uniform f32_4* %415 = OpAccessChain %24 %264 %264 
                                       f32_4 %416 = OpLoad %415 
                                       f32_3 %417 = OpVectorShuffle %416 %416 0 1 2 
                              Uniform f32_4* %418 = OpAccessChain %24 %396 %256 
                                       f32_4 %419 = OpLoad %418 
                                       f32_3 %420 = OpVectorShuffle %419 %419 2 2 2 
                                       f32_3 %421 = OpFMul %417 %420 
                                       f32_4 %422 = OpLoad %9 
                                       f32_3 %423 = OpVectorShuffle %422 %422 0 1 2 
                                       f32_3 %424 = OpFAdd %421 %423 
                                       f32_4 %425 = OpLoad %9 
                                       f32_4 %426 = OpVectorShuffle %425 %424 4 5 6 3 
                                                      OpStore %9 %426 
                              Uniform f32_4* %427 = OpAccessChain %24 %264 %273 
                                       f32_4 %428 = OpLoad %427 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                              Uniform f32_4* %430 = OpAccessChain %24 %396 %256 
                                       f32_4 %431 = OpLoad %430 
                                       f32_3 %432 = OpVectorShuffle %431 %431 3 3 3 
                                       f32_3 %433 = OpFMul %429 %432 
                                       f32_4 %434 = OpLoad %9 
                                       f32_3 %435 = OpVectorShuffle %434 %434 0 1 2 
                                       f32_3 %436 = OpFAdd %433 %435 
                                       f32_4 %437 = OpLoad %9 
                                       f32_4 %438 = OpVectorShuffle %437 %436 4 5 6 3 
                                                      OpStore %9 %438 
                                       f32_4 %439 = OpLoad %9 
                                       f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
                                       f32_3 %443 = OpLoad %442 
                                         f32 %444 = OpDot %440 %443 
                                Private f32* %445 = OpAccessChain %9 %40 
                                                      OpStore %445 %444 
                              Uniform f32_4* %446 = OpAccessChain %24 %264 %217 
                                       f32_4 %447 = OpLoad %446 
                                       f32_3 %448 = OpVectorShuffle %447 %447 0 1 2 
                              Uniform f32_4* %449 = OpAccessChain %24 %396 %217 
                                       f32_4 %450 = OpLoad %449 
                                       f32_3 %451 = OpVectorShuffle %450 %450 1 1 1 
                                       f32_3 %452 = OpFMul %448 %451 
                                       f32_4 %453 = OpLoad %92 
                                       f32_4 %454 = OpVectorShuffle %453 %452 4 5 6 3 
                                                      OpStore %92 %454 
                              Uniform f32_4* %455 = OpAccessChain %24 %264 %256 
                                       f32_4 %456 = OpLoad %455 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
                              Uniform f32_4* %458 = OpAccessChain %24 %396 %217 
                                       f32_4 %459 = OpLoad %458 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 0 0 
                                       f32_3 %461 = OpFMul %457 %460 
                                       f32_4 %462 = OpLoad %92 
                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                                       f32_3 %464 = OpFAdd %461 %463 
                                       f32_4 %465 = OpLoad %92 
                                       f32_4 %466 = OpVectorShuffle %465 %464 4 5 6 3 
                                                      OpStore %92 %466 
                              Uniform f32_4* %467 = OpAccessChain %24 %264 %264 
                                       f32_4 %468 = OpLoad %467 
                                       f32_3 %469 = OpVectorShuffle %468 %468 0 1 2 
                              Uniform f32_4* %470 = OpAccessChain %24 %396 %217 
                                       f32_4 %471 = OpLoad %470 
                                       f32_3 %472 = OpVectorShuffle %471 %471 2 2 2 
                                       f32_3 %473 = OpFMul %469 %472 
                                       f32_4 %474 = OpLoad %92 
                                       f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
                                       f32_3 %476 = OpFAdd %473 %475 
                                       f32_4 %477 = OpLoad %92 
                                       f32_4 %478 = OpVectorShuffle %477 %476 4 5 6 3 
                                                      OpStore %92 %478 
                              Uniform f32_4* %479 = OpAccessChain %24 %264 %273 
                                       f32_4 %480 = OpLoad %479 
                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
                              Uniform f32_4* %482 = OpAccessChain %24 %396 %217 
                                       f32_4 %483 = OpLoad %482 
                                       f32_3 %484 = OpVectorShuffle %483 %483 3 3 3 
                                       f32_3 %485 = OpFMul %481 %484 
                                       f32_4 %486 = OpLoad %92 
                                       f32_3 %487 = OpVectorShuffle %486 %486 0 1 2 
                                       f32_3 %488 = OpFAdd %485 %487 
                                       f32_4 %489 = OpLoad %92 
                                       f32_4 %490 = OpVectorShuffle %489 %488 4 5 6 3 
                                                      OpStore %92 %490 
                                       f32_4 %491 = OpLoad %92 
                                       f32_3 %492 = OpVectorShuffle %491 %491 0 1 2 
                                       f32_3 %493 = OpLoad %442 
                                         f32 %494 = OpDot %492 %493 
                                Private f32* %495 = OpAccessChain %9 %297 
                                                      OpStore %495 %494 
                              Uniform f32_4* %496 = OpAccessChain %24 %264 %217 
                                       f32_4 %497 = OpLoad %496 
                                       f32_3 %498 = OpVectorShuffle %497 %497 0 1 2 
                              Uniform f32_4* %499 = OpAccessChain %24 %396 %264 
                                       f32_4 %500 = OpLoad %499 
                                       f32_3 %501 = OpVectorShuffle %500 %500 1 1 1 
                                       f32_3 %502 = OpFMul %498 %501 
                                       f32_4 %503 = OpLoad %92 
                                       f32_4 %504 = OpVectorShuffle %503 %502 4 5 6 3 
                                                      OpStore %92 %504 
                              Uniform f32_4* %505 = OpAccessChain %24 %264 %256 
                                       f32_4 %506 = OpLoad %505 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                              Uniform f32_4* %508 = OpAccessChain %24 %396 %264 
                                       f32_4 %509 = OpLoad %508 
                                       f32_3 %510 = OpVectorShuffle %509 %509 0 0 0 
                                       f32_3 %511 = OpFMul %507 %510 
                                       f32_4 %512 = OpLoad %92 
                                       f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
                                       f32_3 %514 = OpFAdd %511 %513 
                                       f32_4 %515 = OpLoad %92 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 5 6 3 
                                                      OpStore %92 %516 
                              Uniform f32_4* %517 = OpAccessChain %24 %264 %264 
                                       f32_4 %518 = OpLoad %517 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                              Uniform f32_4* %520 = OpAccessChain %24 %396 %264 
                                       f32_4 %521 = OpLoad %520 
                                       f32_3 %522 = OpVectorShuffle %521 %521 2 2 2 
                                       f32_3 %523 = OpFMul %519 %522 
                                       f32_4 %524 = OpLoad %92 
                                       f32_3 %525 = OpVectorShuffle %524 %524 0 1 2 
                                       f32_3 %526 = OpFAdd %523 %525 
                                       f32_4 %527 = OpLoad %92 
                                       f32_4 %528 = OpVectorShuffle %527 %526 4 5 6 3 
                                                      OpStore %92 %528 
                              Uniform f32_4* %529 = OpAccessChain %24 %264 %273 
                                       f32_4 %530 = OpLoad %529 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                              Uniform f32_4* %532 = OpAccessChain %24 %396 %264 
                                       f32_4 %533 = OpLoad %532 
                                       f32_3 %534 = OpVectorShuffle %533 %533 3 3 3 
                                       f32_3 %535 = OpFMul %531 %534 
                                       f32_4 %536 = OpLoad %92 
                                       f32_3 %537 = OpVectorShuffle %536 %536 0 1 2 
                                       f32_3 %538 = OpFAdd %535 %537 
                                       f32_4 %539 = OpLoad %92 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %92 %540 
                                       f32_4 %541 = OpLoad %92 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 1 2 
                                       f32_3 %543 = OpLoad %442 
                                         f32 %544 = OpDot %542 %543 
                                Private f32* %545 = OpAccessChain %9 %201 
                                                      OpStore %545 %544 
                                       f32_4 %546 = OpLoad %9 
                                       f32_3 %547 = OpVectorShuffle %546 %546 0 1 2 
                                       f32_4 %548 = OpLoad %9 
                                       f32_3 %549 = OpVectorShuffle %548 %548 0 1 2 
                                         f32 %550 = OpDot %547 %549 
                                                      OpStore %179 %550 
                                         f32 %551 = OpLoad %179 
                                         f32 %552 = OpExtInst %1 32 %551 
                                                      OpStore %179 %552 
                                         f32 %553 = OpLoad %179 
                                       f32_3 %554 = OpCompositeConstruct %553 %553 %553 
                                       f32_4 %555 = OpLoad %9 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                       f32_3 %557 = OpFMul %554 %556 
                                       f32_4 %558 = OpLoad vs_TEXCOORD1 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %559 
                                 Output f32* %560 = OpAccessChain %301 %256 %297 
                                         f32 %561 = OpLoad %560 
                                         f32 %562 = OpFNegate %561 
                                 Output f32* %563 = OpAccessChain %301 %256 %297 
                                                      OpStore %563 %562 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 111
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %66 %79 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %34 Location 34 
                                             OpMemberDecorate %39 0 Offset 39 
                                             OpDecorate %39 Block 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate vs_TEXCOORD1 Location 66 
                                             OpDecorate %79 Location 79 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypePointer Input %23 
                        Input f32_4* %34 = OpVariable Input 
                                     %35 = OpTypePointer Input %6 
                                     %39 = OpTypeStruct %6 
                                     %40 = OpTypePointer Uniform %39 
              Uniform struct {f32;}* %41 = OpVariable Uniform 
                                     %42 = OpTypeInt 32 1 
                                 i32 %43 = OpConstant 0 
                                     %44 = OpTypePointer Uniform %6 
                                     %50 = OpTypeBool 
                                     %51 = OpTypePointer Private %50 
                       Private bool* %52 = OpVariable Private 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 i32 %58 = OpConstant 1 
                                 i32 %60 = OpConstant -1 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 u32 %67 = OpConstant 2 
                                 f32 %70 = OpConstant 3.674022E-40 
                                     %78 = OpTypePointer Output %23 
                       Output f32_4* %79 = OpVariable Output 
                                 f32 %81 = OpConstant 3.674022E-40 
                               f32_2 %82 = OpConstantComposite %81 %81 
                                 f32 %84 = OpConstant 3.674022E-40 
                               f32_2 %85 = OpConstantComposite %84 %84 
                                 f32 %91 = OpConstant 3.674022E-40 
                               f32_2 %92 = OpConstantComposite %70 %91 
                                 u32 %96 = OpConstant 1 
                                f32 %100 = OpConstant 3.674022E-40 
                                    %105 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                          Input f32* %36 = OpAccessChain %34 %26 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFMul %32 %37 
                        Uniform f32* %45 = OpAccessChain %41 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                                 f32 %48 = OpFAdd %38 %47 
                        Private f32* %49 = OpAccessChain %9 %28 
                                             OpStore %49 %48 
                        Private f32* %53 = OpAccessChain %9 %28 
                                 f32 %54 = OpLoad %53 
                                bool %56 = OpFOrdLessThan %54 %55 
                                             OpStore %52 %56 
                                bool %57 = OpLoad %52 
                                 i32 %59 = OpSelect %57 %58 %43 
                                 i32 %61 = OpIMul %59 %60 
                                bool %62 = OpINotEqual %61 %43 
                                             OpSelectionMerge %64 None 
                                             OpBranchConditional %62 %63 %64 
                                     %63 = OpLabel 
                                             OpKill
                                     %64 = OpLabel 
                          Input f32* %68 = OpAccessChain vs_TEXCOORD1 %67 
                                 f32 %69 = OpLoad %68 
                                 f32 %71 = OpFAdd %69 %70 
                        Private f32* %72 = OpAccessChain %9 %28 
                                             OpStore %72 %71 
                               f32_4 %73 = OpLoad vs_TEXCOORD1 
                               f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               f32_2 %75 = OpLoad %9 
                               f32_2 %76 = OpVectorShuffle %75 %75 0 0 
                               f32_2 %77 = OpFDiv %74 %76 
                                             OpStore %9 %77 
                               f32_2 %80 = OpLoad %9 
                               f32_2 %83 = OpFMul %80 %82 
                               f32_2 %86 = OpFAdd %83 %85 
                               f32_4 %87 = OpLoad %79 
                               f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                             OpStore %79 %88 
                               f32_4 %89 = OpLoad vs_TEXCOORD1 
                               f32_2 %90 = OpVectorShuffle %89 %89 3 3 
                               f32_2 %93 = OpFMul %90 %92 
                                             OpStore %9 %93 
                               f32_2 %94 = OpLoad %9 
                               f32_2 %95 = OpExtInst %1 10 %94 
                                             OpStore %9 %95 
                        Private f32* %97 = OpAccessChain %9 %96 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpFNegate %98 
                                f32 %101 = OpFMul %99 %100 
                       Private f32* %102 = OpAccessChain %9 %28 
                                f32 %103 = OpLoad %102 
                                f32 %104 = OpFAdd %101 %103 
                        Output f32* %106 = OpAccessChain %79 %67 
                                             OpStore %106 %104 
                       Private f32* %107 = OpAccessChain %9 %96 
                                f32 %108 = OpLoad %107 
                        Output f32* %109 = OpAccessChain %79 %26 
                                             OpStore %109 %108 
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
SubShader {
 Tags { "RenderType" = "Grass" }
 Pass {
  Tags { "RenderType" = "Grass" }
  Cull Off
  GpuProgramID 638220
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = in_POSITION0.xz * _WaveAndDistance.yy;
    u_xlat1 = u_xlat0.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat0 = u_xlat0.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat1;
    u_xlat0 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat0;
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat1 = u_xlat0 * u_xlat0;
    u_xlat2 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat2 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat0;
    u_xlat2 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat0 = u_xlat2 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat0;
    u_xlat0 = u_xlat1 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = in_COLOR0.w * _WaveAndDistance.z;
    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = dot(u_xlat0, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat0.x = u_xlat0.x * 0.699999988;
    u_xlat2.x = dot(u_xlat1, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat2.z = dot(u_xlat1, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat1.xz = (-u_xlat2.xz) * _WaveAndDistance.zz + in_POSITION0.xz;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat1.y = in_POSITION0.y;
    u_xlat4.xyz = u_xlat1.xyz + (-_CameraPosition.xyz);
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) + _WaveAndDistance.w;
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    vs_COLOR0.w = u_xlat4.x * _CameraPosition.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    u_xlat4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat2.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat2.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat2.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w * vs_COLOR0.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 516
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %108 %214 %249 %295 %296 %338 %392 
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
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %108 Location 108 
                                                      OpMemberDecorate %212 0 BuiltIn 212 
                                                      OpMemberDecorate %212 1 BuiltIn 212 
                                                      OpMemberDecorate %212 2 BuiltIn 212 
                                                      OpDecorate %212 Block 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate vs_TEXCOORD0 Location 295 
                                                      OpDecorate %296 Location 296 
                                                      OpDecorate vs_TEXCOORD1 Location 338 
                                                      OpDecorate %392 Location 392 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeStruct %7 %17 %18 %19 %20 %21 %7 %7 %7 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 7 
                                              %27 = OpTypePointer Uniform %7 
                               Private f32_4* %34 = OpVariable Private 
                                          f32 %37 = OpConstant 3.674022E-40 
                                          f32 %38 = OpConstant 3.674022E-40 
                                          f32 %39 = OpConstant 3.674022E-40 
                                        f32_4 %40 = OpConstantComposite %37 %38 %38 %39 
                                          f32 %44 = OpConstant 3.674022E-40 
                                          f32 %45 = OpConstant 3.674022E-40 
                                          f32 %46 = OpConstant 3.674022E-40 
                                        f32_4 %47 = OpConstantComposite %44 %38 %45 %46 
                                          f32 %54 = OpConstant 3.674022E-40 
                                          f32 %55 = OpConstant 3.674022E-40 
                                          f32 %56 = OpConstant 3.674022E-40 
                                          f32 %57 = OpConstant 3.674022E-40 
                                        f32_4 %58 = OpConstantComposite %54 %55 %56 %57 
                                          f32 %65 = OpConstant 3.674022E-40 
                                        f32_4 %66 = OpConstantComposite %65 %65 %65 %65 
                                          f32 %68 = OpConstant 3.674022E-40 
                                        f32_4 %69 = OpConstantComposite %68 %68 %68 %68 
                               Private f32_4* %74 = OpVariable Private 
                                          f32 %79 = OpConstant 3.674022E-40 
                                        f32_4 %80 = OpConstantComposite %79 %79 %79 %79 
                                          f32 %91 = OpConstant 3.674022E-40 
                                        f32_4 %92 = OpConstantComposite %91 %91 %91 %91 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_4 %98 = OpConstantComposite %97 %97 %97 %97 
                                Input f32_4* %108 = OpVariable Input 
                                         u32 %109 = OpConstant 3 
                                             %110 = OpTypePointer Input %6 
                                         u32 %113 = OpConstant 2 
                                             %114 = OpTypePointer Uniform %6 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         f32 %126 = OpConstant 3.674022E-40 
                                         f32 %127 = OpConstant 3.674022E-40 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_4 %129 = OpConstantComposite %126 %126 %127 %128 
                                         f32 %134 = OpConstant 3.674022E-40 
                                         f32 %138 = OpConstant 3.674022E-40 
                                         f32 %139 = OpConstant 3.674022E-40 
                                         f32 %140 = OpConstant 3.674022E-40 
                                       f32_4 %141 = OpConstantComposite %46 %138 %139 %140 
                                         f32 %145 = OpConstant 3.674022E-40 
                                         f32 %146 = OpConstant 3.674022E-40 
                                       f32_4 %147 = OpConstantComposite %37 %38 %145 %146 
                                         i32 %164 = OpConstant 1 
                                         i32 %168 = OpConstant 0 
                                         i32 %176 = OpConstant 2 
                                         i32 %185 = OpConstant 3 
                              Private f32_4* %189 = OpVariable Private 
                                         i32 %192 = OpConstant 5 
                                         u32 %210 = OpConstant 1 
                                             %211 = OpTypeArray %6 %210 
                                             %212 = OpTypeStruct %7 %6 %211 
                                             %213 = OpTypePointer Output %212 
        Output struct {f32_4; f32; f32[1];}* %214 = OpVariable Output 
                                             %222 = OpTypePointer Output %7 
                                             %227 = OpTypeVector %6 3 
                                             %228 = OpTypePointer Private %227 
                              Private f32_3* %229 = OpVariable Private 
                                         i32 %232 = OpConstant 8 
                               Output f32_4* %249 = OpVariable Output 
                                             %256 = OpTypePointer Output %6 
                                         f32 %260 = OpConstant 3.674022E-40 
                                         f32 %261 = OpConstant 3.674022E-40 
                                         i32 %264 = OpConstant 6 
                                         f32 %268 = OpConstant 3.674022E-40 
                                       f32_3 %269 = OpConstantComposite %268 %268 %268 
                                         f32 %275 = OpConstant 3.674022E-40 
                                       f32_3 %276 = OpConstantComposite %275 %275 %275 
                                             %294 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %296 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %346 = OpConstant 4 
                                             %391 = OpTypePointer Input %227 
                                Input f32_3* %392 = OpVariable Input 
                                Private f32* %496 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 2 
                               Uniform f32_4* %28 = OpAccessChain %24 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_2 %30 = OpVectorShuffle %29 %29 1 1 
                                        f32_2 %31 = OpFMul %14 %30 
                                        f32_4 %32 = OpLoad %9 
                                        f32_4 %33 = OpVectorShuffle %32 %31 4 5 2 3 
                                                      OpStore %9 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpVectorShuffle %35 %35 1 1 1 1 
                                        f32_4 %41 = OpFMul %36 %40 
                                                      OpStore %34 %41 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpVectorShuffle %42 %42 0 0 0 0 
                                        f32_4 %48 = OpFMul %43 %47 
                                        f32_4 %49 = OpLoad %34 
                                        f32_4 %50 = OpFAdd %48 %49 
                                                      OpStore %9 %50 
                               Uniform f32_4* %51 = OpAccessChain %24 %26 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpVectorShuffle %52 %52 0 0 0 0 
                                        f32_4 %59 = OpFMul %53 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %9 %61 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpExtInst %1 10 %62 
                                                      OpStore %9 %63 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %70 = OpFAdd %67 %69 
                                                      OpStore %9 %70 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFMul %71 %72 
                                                      OpStore %34 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpLoad %34 
                                        f32_4 %77 = OpFMul %75 %76 
                                                      OpStore %74 %77 
                                        f32_4 %78 = OpLoad %74 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %9 %83 
                                        f32_4 %84 = OpLoad %34 
                                        f32_4 %85 = OpLoad %74 
                                        f32_4 %86 = OpFMul %84 %85 
                                                      OpStore %74 %86 
                                        f32_4 %87 = OpLoad %34 
                                        f32_4 %88 = OpLoad %74 
                                        f32_4 %89 = OpFMul %87 %88 
                                                      OpStore %34 %89 
                                        f32_4 %90 = OpLoad %74 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %9 %95 
                                        f32_4 %96 = OpLoad %34 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %9 %101 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpFMul %102 %103 
                                                      OpStore %9 %104 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpFMul %105 %106 
                                                      OpStore %9 %107 
                                  Input f32* %111 = OpAccessChain %108 %109 
                                         f32 %112 = OpLoad %111 
                                Uniform f32* %115 = OpAccessChain %24 %26 %113 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFMul %112 %116 
                                Private f32* %120 = OpAccessChain %34 %118 
                                                      OpStore %120 %117 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpLoad %34 
                                       f32_4 %123 = OpVectorShuffle %122 %122 0 0 0 0 
                                       f32_4 %124 = OpFMul %121 %123 
                                                      OpStore %34 %124 
                                       f32_4 %125 = OpLoad %9 
                                         f32 %130 = OpDot %125 %129 
                                Private f32* %131 = OpAccessChain %9 %118 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %9 %118 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                Private f32* %136 = OpAccessChain %9 %118 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %34 
                                         f32 %142 = OpDot %137 %141 
                                Private f32* %143 = OpAccessChain %74 %118 
                                                      OpStore %143 %142 
                                       f32_4 %144 = OpLoad %34 
                                         f32 %148 = OpDot %144 %147 
                                Private f32* %149 = OpAccessChain %74 %113 
                                                      OpStore %149 %148 
                                       f32_4 %150 = OpLoad %74 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 2 
                                       f32_2 %152 = OpFNegate %151 
                              Uniform f32_4* %153 = OpAccessChain %24 %26 
                                       f32_4 %154 = OpLoad %153 
                                       f32_2 %155 = OpVectorShuffle %154 %154 2 2 
                                       f32_2 %156 = OpFMul %152 %155 
                                       f32_4 %157 = OpLoad %11 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 2 
                                       f32_2 %159 = OpFAdd %156 %158 
                                       f32_4 %160 = OpLoad %34 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 3 
                                                      OpStore %34 %161 
                                       f32_4 %162 = OpLoad %11 
                                       f32_4 %163 = OpVectorShuffle %162 %162 1 1 1 1 
                              Uniform f32_4* %165 = OpAccessChain %24 %164 %164 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFMul %163 %166 
                                                      OpStore %74 %167 
                              Uniform f32_4* %169 = OpAccessChain %24 %164 %168 
                                       f32_4 %170 = OpLoad %169 
                                       f32_4 %171 = OpLoad %34 
                                       f32_4 %172 = OpVectorShuffle %171 %171 0 0 0 0 
                                       f32_4 %173 = OpFMul %170 %172 
                                       f32_4 %174 = OpLoad %74 
                                       f32_4 %175 = OpFAdd %173 %174 
                                                      OpStore %74 %175 
                              Uniform f32_4* %177 = OpAccessChain %24 %164 %176 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpLoad %34 
                                       f32_4 %180 = OpVectorShuffle %179 %179 2 2 2 2 
                                       f32_4 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %74 
                                       f32_4 %183 = OpFAdd %181 %182 
                                                      OpStore %74 %183 
                                       f32_4 %184 = OpLoad %74 
                              Uniform f32_4* %186 = OpAccessChain %24 %164 %185 
                                       f32_4 %187 = OpLoad %186 
                                       f32_4 %188 = OpFAdd %184 %187 
                                                      OpStore %74 %188 
                                       f32_4 %190 = OpLoad %74 
                                       f32_4 %191 = OpVectorShuffle %190 %190 1 1 1 1 
                              Uniform f32_4* %193 = OpAccessChain %24 %192 %164 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpFMul %191 %194 
                                                      OpStore %189 %195 
                              Uniform f32_4* %196 = OpAccessChain %24 %192 %168 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpLoad %74 
                                       f32_4 %199 = OpVectorShuffle %198 %198 0 0 0 0 
                                       f32_4 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %189 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %189 %202 
                              Uniform f32_4* %203 = OpAccessChain %24 %192 %176 
                                       f32_4 %204 = OpLoad %203 
                                       f32_4 %205 = OpLoad %74 
                                       f32_4 %206 = OpVectorShuffle %205 %205 2 2 2 2 
                                       f32_4 %207 = OpFMul %204 %206 
                                       f32_4 %208 = OpLoad %189 
                                       f32_4 %209 = OpFAdd %207 %208 
                                                      OpStore %189 %209 
                              Uniform f32_4* %215 = OpAccessChain %24 %192 %185 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpLoad %74 
                                       f32_4 %218 = OpVectorShuffle %217 %217 3 3 3 3 
                                       f32_4 %219 = OpFMul %216 %218 
                                       f32_4 %220 = OpLoad %189 
                                       f32_4 %221 = OpFAdd %219 %220 
                               Output f32_4* %223 = OpAccessChain %214 %168 
                                                      OpStore %223 %221 
                                  Input f32* %224 = OpAccessChain %11 %210 
                                         f32 %225 = OpLoad %224 
                                Private f32* %226 = OpAccessChain %34 %210 
                                                      OpStore %226 %225 
                                       f32_4 %230 = OpLoad %34 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              Uniform f32_4* %233 = OpAccessChain %24 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFNegate %235 
                                       f32_3 %237 = OpFAdd %231 %236 
                                                      OpStore %229 %237 
                                       f32_3 %238 = OpLoad %229 
                                       f32_3 %239 = OpLoad %229 
                                         f32 %240 = OpDot %238 %239 
                                Private f32* %241 = OpAccessChain %229 %118 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %229 %118 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFNegate %243 
                                Uniform f32* %245 = OpAccessChain %24 %26 %109 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFAdd %244 %246 
                                Private f32* %248 = OpAccessChain %229 %118 
                                                      OpStore %248 %247 
                              Uniform f32_4* %250 = OpAccessChain %24 %232 
                                       f32_4 %251 = OpLoad %250 
                                       f32_2 %252 = OpVectorShuffle %251 %251 3 3 
                                       f32_3 %253 = OpLoad %229 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 0 
                                         f32 %255 = OpDot %252 %254 
                                 Output f32* %257 = OpAccessChain %249 %109 
                                                      OpStore %257 %255 
                                 Output f32* %258 = OpAccessChain %249 %109 
                                         f32 %259 = OpLoad %258 
                                         f32 %262 = OpExtInst %1 43 %259 %260 %261 
                                 Output f32* %263 = OpAccessChain %249 %109 
                                                      OpStore %263 %262 
                              Uniform f32_4* %265 = OpAccessChain %24 %264 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %270 = OpFAdd %267 %269 
                                                      OpStore %229 %270 
                                       f32_4 %271 = OpLoad %9 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 0 0 
                                       f32_3 %273 = OpLoad %229 
                                       f32_3 %274 = OpFMul %272 %273 
                                       f32_3 %277 = OpFAdd %274 %276 
                                       f32_4 %278 = OpLoad %9 
                                       f32_4 %279 = OpVectorShuffle %278 %277 4 5 6 3 
                                                      OpStore %9 %279 
                                       f32_4 %280 = OpLoad %9 
                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                       f32_4 %282 = OpLoad %108 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFMul %281 %283 
                                       f32_4 %285 = OpLoad %9 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %9 %286 
                                       f32_4 %287 = OpLoad %9 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_4 %289 = OpLoad %9 
                                       f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
                                       f32_3 %291 = OpFAdd %288 %290 
                                       f32_4 %292 = OpLoad %249 
                                       f32_4 %293 = OpVectorShuffle %292 %291 4 5 6 3 
                                                      OpStore %249 %293 
                                       f32_4 %297 = OpLoad %296 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                                      OpStore vs_TEXCOORD0 %298 
                                Private f32* %299 = OpAccessChain %74 %210 
                                         f32 %300 = OpLoad %299 
                                Uniform f32* %301 = OpAccessChain %24 %185 %164 %113 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFMul %300 %302 
                                Private f32* %304 = OpAccessChain %9 %118 
                                                      OpStore %304 %303 
                                Uniform f32* %305 = OpAccessChain %24 %185 %168 %113 
                                         f32 %306 = OpLoad %305 
                                Private f32* %307 = OpAccessChain %74 %118 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFMul %306 %308 
                                Private f32* %310 = OpAccessChain %9 %118 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFAdd %309 %311 
                                Private f32* %313 = OpAccessChain %9 %118 
                                                      OpStore %313 %312 
                                Uniform f32* %314 = OpAccessChain %24 %185 %176 %113 
                                         f32 %315 = OpLoad %314 
                                Private f32* %316 = OpAccessChain %74 %113 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %315 %317 
                                Private f32* %319 = OpAccessChain %9 %118 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpFAdd %318 %320 
                                Private f32* %322 = OpAccessChain %9 %118 
                                                      OpStore %322 %321 
                                Uniform f32* %323 = OpAccessChain %24 %185 %185 %113 
                                         f32 %324 = OpLoad %323 
                                Private f32* %325 = OpAccessChain %74 %109 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpFMul %324 %326 
                                Private f32* %328 = OpAccessChain %9 %118 
                                         f32 %329 = OpLoad %328 
                                         f32 %330 = OpFAdd %327 %329 
                                Private f32* %331 = OpAccessChain %9 %118 
                                                      OpStore %331 %330 
                                Private f32* %332 = OpAccessChain %9 %118 
                                         f32 %333 = OpLoad %332 
                                Uniform f32* %334 = OpAccessChain %24 %168 %109 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFMul %333 %335 
                                Private f32* %337 = OpAccessChain %9 %118 
                                                      OpStore %337 %336 
                                Private f32* %339 = OpAccessChain %9 %118 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpFNegate %340 
                                 Output f32* %342 = OpAccessChain vs_TEXCOORD1 %109 
                                                      OpStore %342 %341 
                              Uniform f32_4* %343 = OpAccessChain %24 %176 %164 
                                       f32_4 %344 = OpLoad %343 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                              Uniform f32_4* %347 = OpAccessChain %24 %346 %168 
                                       f32_4 %348 = OpLoad %347 
                                       f32_3 %349 = OpVectorShuffle %348 %348 1 1 1 
                                       f32_3 %350 = OpFMul %345 %349 
                                       f32_4 %351 = OpLoad %9 
                                       f32_4 %352 = OpVectorShuffle %351 %350 4 5 6 3 
                                                      OpStore %9 %352 
                              Uniform f32_4* %353 = OpAccessChain %24 %176 %168 
                                       f32_4 %354 = OpLoad %353 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                              Uniform f32_4* %356 = OpAccessChain %24 %346 %168 
                                       f32_4 %357 = OpLoad %356 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 0 0 
                                       f32_3 %359 = OpFMul %355 %358 
                                       f32_4 %360 = OpLoad %9 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                       f32_3 %362 = OpFAdd %359 %361 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %364 = OpVectorShuffle %363 %362 4 5 6 3 
                                                      OpStore %9 %364 
                              Uniform f32_4* %365 = OpAccessChain %24 %176 %176 
                                       f32_4 %366 = OpLoad %365 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                              Uniform f32_4* %368 = OpAccessChain %24 %346 %168 
                                       f32_4 %369 = OpLoad %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 2 2 2 
                                       f32_3 %371 = OpFMul %367 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %9 %376 
                              Uniform f32_4* %377 = OpAccessChain %24 %176 %185 
                                       f32_4 %378 = OpLoad %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                              Uniform f32_4* %380 = OpAccessChain %24 %346 %168 
                                       f32_4 %381 = OpLoad %380 
                                       f32_3 %382 = OpVectorShuffle %381 %381 3 3 3 
                                       f32_3 %383 = OpFMul %379 %382 
                                       f32_4 %384 = OpLoad %9 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFAdd %383 %385 
                                       f32_4 %387 = OpLoad %9 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
                                                      OpStore %9 %388 
                                       f32_4 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %393 = OpLoad %392 
                                         f32 %394 = OpDot %390 %393 
                                Private f32* %395 = OpAccessChain %9 %118 
                                                      OpStore %395 %394 
                              Uniform f32_4* %396 = OpAccessChain %24 %176 %164 
                                       f32_4 %397 = OpLoad %396 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                              Uniform f32_4* %399 = OpAccessChain %24 %346 %164 
                                       f32_4 %400 = OpLoad %399 
                                       f32_3 %401 = OpVectorShuffle %400 %400 1 1 1 
                                       f32_3 %402 = OpFMul %398 %401 
                                       f32_4 %403 = OpLoad %34 
                                       f32_4 %404 = OpVectorShuffle %403 %402 4 5 6 3 
                                                      OpStore %34 %404 
                              Uniform f32_4* %405 = OpAccessChain %24 %176 %168 
                                       f32_4 %406 = OpLoad %405 
                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                              Uniform f32_4* %408 = OpAccessChain %24 %346 %164 
                                       f32_4 %409 = OpLoad %408 
                                       f32_3 %410 = OpVectorShuffle %409 %409 0 0 0 
                                       f32_3 %411 = OpFMul %407 %410 
                                       f32_4 %412 = OpLoad %34 
                                       f32_3 %413 = OpVectorShuffle %412 %412 0 1 2 
                                       f32_3 %414 = OpFAdd %411 %413 
                                       f32_4 %415 = OpLoad %34 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 6 3 
                                                      OpStore %34 %416 
                              Uniform f32_4* %417 = OpAccessChain %24 %176 %176 
                                       f32_4 %418 = OpLoad %417 
                                       f32_3 %419 = OpVectorShuffle %418 %418 0 1 2 
                              Uniform f32_4* %420 = OpAccessChain %24 %346 %164 
                                       f32_4 %421 = OpLoad %420 
                                       f32_3 %422 = OpVectorShuffle %421 %421 2 2 2 
                                       f32_3 %423 = OpFMul %419 %422 
                                       f32_4 %424 = OpLoad %34 
                                       f32_3 %425 = OpVectorShuffle %424 %424 0 1 2 
                                       f32_3 %426 = OpFAdd %423 %425 
                                       f32_4 %427 = OpLoad %34 
                                       f32_4 %428 = OpVectorShuffle %427 %426 4 5 6 3 
                                                      OpStore %34 %428 
                              Uniform f32_4* %429 = OpAccessChain %24 %176 %185 
                                       f32_4 %430 = OpLoad %429 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
                              Uniform f32_4* %432 = OpAccessChain %24 %346 %164 
                                       f32_4 %433 = OpLoad %432 
                                       f32_3 %434 = OpVectorShuffle %433 %433 3 3 3 
                                       f32_3 %435 = OpFMul %431 %434 
                                       f32_4 %436 = OpLoad %34 
                                       f32_3 %437 = OpVectorShuffle %436 %436 0 1 2 
                                       f32_3 %438 = OpFAdd %435 %437 
                                       f32_4 %439 = OpLoad %34 
                                       f32_4 %440 = OpVectorShuffle %439 %438 4 5 6 3 
                                                      OpStore %34 %440 
                                       f32_4 %441 = OpLoad %34 
                                       f32_3 %442 = OpVectorShuffle %441 %441 0 1 2 
                                       f32_3 %443 = OpLoad %392 
                                         f32 %444 = OpDot %442 %443 
                                Private f32* %445 = OpAccessChain %9 %210 
                                                      OpStore %445 %444 
                              Uniform f32_4* %446 = OpAccessChain %24 %176 %164 
                                       f32_4 %447 = OpLoad %446 
                                       f32_3 %448 = OpVectorShuffle %447 %447 0 1 2 
                              Uniform f32_4* %449 = OpAccessChain %24 %346 %176 
                                       f32_4 %450 = OpLoad %449 
                                       f32_3 %451 = OpVectorShuffle %450 %450 1 1 1 
                                       f32_3 %452 = OpFMul %448 %451 
                                       f32_4 %453 = OpLoad %34 
                                       f32_4 %454 = OpVectorShuffle %453 %452 4 5 6 3 
                                                      OpStore %34 %454 
                              Uniform f32_4* %455 = OpAccessChain %24 %176 %168 
                                       f32_4 %456 = OpLoad %455 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
                              Uniform f32_4* %458 = OpAccessChain %24 %346 %176 
                                       f32_4 %459 = OpLoad %458 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 0 0 
                                       f32_3 %461 = OpFMul %457 %460 
                                       f32_4 %462 = OpLoad %34 
                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                                       f32_3 %464 = OpFAdd %461 %463 
                                       f32_4 %465 = OpLoad %34 
                                       f32_4 %466 = OpVectorShuffle %465 %464 4 5 6 3 
                                                      OpStore %34 %466 
                              Uniform f32_4* %467 = OpAccessChain %24 %176 %176 
                                       f32_4 %468 = OpLoad %467 
                                       f32_3 %469 = OpVectorShuffle %468 %468 0 1 2 
                              Uniform f32_4* %470 = OpAccessChain %24 %346 %176 
                                       f32_4 %471 = OpLoad %470 
                                       f32_3 %472 = OpVectorShuffle %471 %471 2 2 2 
                                       f32_3 %473 = OpFMul %469 %472 
                                       f32_4 %474 = OpLoad %34 
                                       f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
                                       f32_3 %476 = OpFAdd %473 %475 
                                       f32_4 %477 = OpLoad %34 
                                       f32_4 %478 = OpVectorShuffle %477 %476 4 5 6 3 
                                                      OpStore %34 %478 
                              Uniform f32_4* %479 = OpAccessChain %24 %176 %185 
                                       f32_4 %480 = OpLoad %479 
                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
                              Uniform f32_4* %482 = OpAccessChain %24 %346 %176 
                                       f32_4 %483 = OpLoad %482 
                                       f32_3 %484 = OpVectorShuffle %483 %483 3 3 3 
                                       f32_3 %485 = OpFMul %481 %484 
                                       f32_4 %486 = OpLoad %34 
                                       f32_3 %487 = OpVectorShuffle %486 %486 0 1 2 
                                       f32_3 %488 = OpFAdd %485 %487 
                                       f32_4 %489 = OpLoad %34 
                                       f32_4 %490 = OpVectorShuffle %489 %488 4 5 6 3 
                                                      OpStore %34 %490 
                                       f32_4 %491 = OpLoad %34 
                                       f32_3 %492 = OpVectorShuffle %491 %491 0 1 2 
                                       f32_3 %493 = OpLoad %392 
                                         f32 %494 = OpDot %492 %493 
                                Private f32* %495 = OpAccessChain %9 %113 
                                                      OpStore %495 %494 
                                       f32_4 %497 = OpLoad %9 
                                       f32_3 %498 = OpVectorShuffle %497 %497 0 1 2 
                                       f32_4 %499 = OpLoad %9 
                                       f32_3 %500 = OpVectorShuffle %499 %499 0 1 2 
                                         f32 %501 = OpDot %498 %500 
                                                      OpStore %496 %501 
                                         f32 %502 = OpLoad %496 
                                         f32 %503 = OpExtInst %1 32 %502 
                                                      OpStore %496 %503 
                                         f32 %504 = OpLoad %496 
                                       f32_3 %505 = OpCompositeConstruct %504 %504 %504 
                                       f32_4 %506 = OpLoad %9 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                       f32_3 %508 = OpFMul %505 %507 
                                       f32_4 %509 = OpLoad vs_TEXCOORD1 
                                       f32_4 %510 = OpVectorShuffle %509 %508 4 5 6 3 
                                                      OpStore vs_TEXCOORD1 %510 
                                 Output f32* %511 = OpAccessChain %214 %168 %210 
                                         f32 %512 = OpLoad %511 
                                         f32 %513 = OpFNegate %512 
                                 Output f32* %514 = OpAccessChain %214 %168 %210 
                                                      OpStore %514 %513 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 111
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %66 %79 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %34 Location 34 
                                             OpMemberDecorate %39 0 Offset 39 
                                             OpDecorate %39 Block 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate vs_TEXCOORD1 Location 66 
                                             OpDecorate %79 Location 79 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypePointer Input %23 
                        Input f32_4* %34 = OpVariable Input 
                                     %35 = OpTypePointer Input %6 
                                     %39 = OpTypeStruct %6 
                                     %40 = OpTypePointer Uniform %39 
              Uniform struct {f32;}* %41 = OpVariable Uniform 
                                     %42 = OpTypeInt 32 1 
                                 i32 %43 = OpConstant 0 
                                     %44 = OpTypePointer Uniform %6 
                                     %50 = OpTypeBool 
                                     %51 = OpTypePointer Private %50 
                       Private bool* %52 = OpVariable Private 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 i32 %58 = OpConstant 1 
                                 i32 %60 = OpConstant -1 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                 u32 %67 = OpConstant 2 
                                 f32 %70 = OpConstant 3.674022E-40 
                                     %78 = OpTypePointer Output %23 
                       Output f32_4* %79 = OpVariable Output 
                                 f32 %81 = OpConstant 3.674022E-40 
                               f32_2 %82 = OpConstantComposite %81 %81 
                                 f32 %84 = OpConstant 3.674022E-40 
                               f32_2 %85 = OpConstantComposite %84 %84 
                                 f32 %91 = OpConstant 3.674022E-40 
                               f32_2 %92 = OpConstantComposite %70 %91 
                                 u32 %96 = OpConstant 1 
                                f32 %100 = OpConstant 3.674022E-40 
                                    %105 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                          Input f32* %36 = OpAccessChain %34 %26 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFMul %32 %37 
                        Uniform f32* %45 = OpAccessChain %41 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                                 f32 %48 = OpFAdd %38 %47 
                        Private f32* %49 = OpAccessChain %9 %28 
                                             OpStore %49 %48 
                        Private f32* %53 = OpAccessChain %9 %28 
                                 f32 %54 = OpLoad %53 
                                bool %56 = OpFOrdLessThan %54 %55 
                                             OpStore %52 %56 
                                bool %57 = OpLoad %52 
                                 i32 %59 = OpSelect %57 %58 %43 
                                 i32 %61 = OpIMul %59 %60 
                                bool %62 = OpINotEqual %61 %43 
                                             OpSelectionMerge %64 None 
                                             OpBranchConditional %62 %63 %64 
                                     %63 = OpLabel 
                                             OpKill
                                     %64 = OpLabel 
                          Input f32* %68 = OpAccessChain vs_TEXCOORD1 %67 
                                 f32 %69 = OpLoad %68 
                                 f32 %71 = OpFAdd %69 %70 
                        Private f32* %72 = OpAccessChain %9 %28 
                                             OpStore %72 %71 
                               f32_4 %73 = OpLoad vs_TEXCOORD1 
                               f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               f32_2 %75 = OpLoad %9 
                               f32_2 %76 = OpVectorShuffle %75 %75 0 0 
                               f32_2 %77 = OpFDiv %74 %76 
                                             OpStore %9 %77 
                               f32_2 %80 = OpLoad %9 
                               f32_2 %83 = OpFMul %80 %82 
                               f32_2 %86 = OpFAdd %83 %85 
                               f32_4 %87 = OpLoad %79 
                               f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                             OpStore %79 %88 
                               f32_4 %89 = OpLoad vs_TEXCOORD1 
                               f32_2 %90 = OpVectorShuffle %89 %89 3 3 
                               f32_2 %93 = OpFMul %90 %92 
                                             OpStore %9 %93 
                               f32_2 %94 = OpLoad %9 
                               f32_2 %95 = OpExtInst %1 10 %94 
                                             OpStore %9 %95 
                        Private f32* %97 = OpAccessChain %9 %96 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpFNegate %98 
                                f32 %101 = OpFMul %99 %100 
                       Private f32* %102 = OpAccessChain %9 %28 
                                f32 %103 = OpLoad %102 
                                f32 %104 = OpFAdd %101 %103 
                        Output f32* %106 = OpAccessChain %79 %67 
                                             OpStore %106 %104 
                       Private f32* %107 = OpAccessChain %9 %96 
                                f32 %108 = OpLoad %107 
                        Output f32* %109 = OpAccessChain %79 %26 
                                             OpStore %109 %108 
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