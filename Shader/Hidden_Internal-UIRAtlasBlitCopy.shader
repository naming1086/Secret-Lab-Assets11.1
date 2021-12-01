//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRAtlasBlitCopy" {
Properties {
_MainTex0 ("Texture", any) = "" { }
_MainTex1 ("Texture", any) = "" { }
_MainTex2 ("Texture", any) = "" { }
_MainTex3 ("Texture", any) = "" { }
_MainTex4 ("Texture", any) = "" { }
_MainTex5 ("Texture", any) = "" { }
_MainTex6 ("Texture", any) = "" { }
_MainTex7 ("Texture", any) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 52704
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex0_ST;
uniform 	vec4 _MainTex1_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	vec4 _MainTex3_ST;
uniform 	vec4 _MainTex4_ST;
uniform 	vec4 _MainTex5_ST;
uniform 	vec4 _MainTex6_ST;
uniform 	vec4 _MainTex7_ST;
in  vec4 in_POSITION0;
in  vec3 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec3 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
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
    u_xlatu0 = uint(in_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex0_ST.xy + _MainTex0_ST.zw;
            break;
        case 1:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex1_ST.xy + _MainTex1_ST.zw;
            break;
        case 2:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
            break;
        case 3:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex3_ST.xy + _MainTex3_ST.zw;
            break;
        case 4:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex4_ST.xy + _MainTex4_ST.zw;
            break;
        case 5:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex5_ST.xy + _MainTex5_ST.zw;
            break;
        case 6:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex6_ST.xy + _MainTex6_ST.zw;
            break;
        case 7:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex7_ST.xy + _MainTex7_ST.zw;
            break;
        default:
            u_xlat0.x = float(0.0);
            u_xlat0.y = float(0.0);
            break;
    }
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
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
UNITY_LOCATION(0) uniform  sampler2D _MainTex0;
UNITY_LOCATION(1) uniform  sampler2D _MainTex1;
UNITY_LOCATION(2) uniform  sampler2D _MainTex2;
UNITY_LOCATION(3) uniform  sampler2D _MainTex3;
UNITY_LOCATION(4) uniform  sampler2D _MainTex4;
UNITY_LOCATION(5) uniform  sampler2D _MainTex5;
UNITY_LOCATION(6) uniform  sampler2D _MainTex6;
UNITY_LOCATION(7) uniform  sampler2D _MainTex7;
in  vec3 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
uint u_xlatu0;
void main()
{
    u_xlatu0 = uint(vs_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat0 = texture(_MainTex0, vs_TEXCOORD0.xy);
            break;
        case 1:
            u_xlat0 = texture(_MainTex1, vs_TEXCOORD0.xy);
            break;
        case 2:
            u_xlat0 = texture(_MainTex2, vs_TEXCOORD0.xy);
            break;
        case 3:
            u_xlat0 = texture(_MainTex3, vs_TEXCOORD0.xy);
            break;
        case 4:
            u_xlat0 = texture(_MainTex4, vs_TEXCOORD0.xy);
            break;
        case 5:
            u_xlat0 = texture(_MainTex5, vs_TEXCOORD0.xy);
            break;
        case 6:
            u_xlat0 = texture(_MainTex6, vs_TEXCOORD0.xy);
            break;
        case 7:
            u_xlat0 = texture(_MainTex7, vs_TEXCOORD0.xy);
            break;
        default:
            u_xlat0.x = float(1.0);
            u_xlat0.y = float(1.0);
            u_xlat0.z = float(1.0);
            u_xlat0.w = float(1.0);
            break;
    }
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 240
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %86 %223 %228 %229 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpMemberDecorate %18 7 Offset 18 
                                                      OpMemberDecorate %18 8 Offset 18 
                                                      OpMemberDecorate %18 9 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %86 Location 86 
                                                      OpDecorate vs_TEXCOORD0 Location 223 
                                                      OpDecorate %228 Location 228 
                                                      OpDecorate %229 Location 229 
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
                                              %18 = OpTypeStruct %16 %17 %7 %7 %7 %7 %7 %7 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 0 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %68 = OpConstant 1 
                                              %69 = OpTypeArray %6 %68 
                                              %70 = OpTypeStruct %7 %6 %69 
                                              %71 = OpTypePointer Output %70 
         Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                              %80 = OpTypePointer Output %7 
                                              %82 = OpTypePointer Private %14 
                                 Private u32* %83 = OpVariable Private 
                                              %84 = OpTypeVector %6 3 
                                              %85 = OpTypePointer Input %84 
                                 Input f32_3* %86 = OpVariable Input 
                                          u32 %87 = OpConstant 2 
                                              %88 = OpTypePointer Input %6 
                                             %104 = OpTypeVector %6 2 
                                         i32 %133 = OpConstant 4 
                                         i32 %147 = OpConstant 5 
                                         i32 %161 = OpConstant 6 
                                         i32 %175 = OpConstant 7 
                                         i32 %189 = OpConstant 8 
                                         i32 %203 = OpConstant 9 
                                         f32 %215 = OpConstant 3.674022E-40 
                                         u32 %216 = OpConstant 0 
                                             %217 = OpTypePointer Private %6 
                                             %222 = OpTypePointer Output %84 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                               Output f32_4* %228 = OpVariable Output 
                                Input f32_4* %229 = OpVariable Input 
                                             %233 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                   Input f32* %89 = OpAccessChain %86 %87 
                                          f32 %90 = OpLoad %89 
                                          u32 %91 = OpConvertFToU %90 
                                                      OpStore %83 %91 
                                          u32 %92 = OpLoad %83 
                                          i32 %93 = OpBitcast %92 
                                                      OpSelectionMerge %103 None 
                     OpSwitch %93 %102 { Selector = 0, Label = %94 } { Selector = 1, Label = %95 } { Selector = 2, Label = %96 } { Selector = 3, Label = %97 } { Selector = 4, Label = %98 } { Selector = 5, Label = %99 } { Selector = 6, Label = %100 } { Selector = 7, Label = %101 } 
                                             %102 = OpLabel 
                                Private f32* %218 = OpAccessChain %9 %216 
                                                      OpStore %218 %215 
                                Private f32* %219 = OpAccessChain %9 %68 
                                                      OpStore %219 %215 
                                                      OpBranch %103 
                                              %94 = OpLabel 
                                       f32_3 %105 = OpLoad %86 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                              Uniform f32_4* %107 = OpAccessChain %20 %35 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %20 %35 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 3 
                                                      OpStore %9 %116 
                                                      OpBranch %103 
                                              %95 = OpLabel 
                                       f32_3 %118 = OpLoad %86 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                              Uniform f32_4* %120 = OpAccessChain %20 %44 
                                       f32_4 %121 = OpLoad %120 
                                       f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                       f32_2 %123 = OpFMul %119 %122 
                              Uniform f32_4* %124 = OpAccessChain %20 %44 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 2 3 
                                       f32_2 %127 = OpFAdd %123 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 2 3 
                                                      OpStore %9 %129 
                                                      OpBranch %103 
                                              %96 = OpLabel 
                                       f32_3 %131 = OpLoad %86 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                              Uniform f32_4* %134 = OpAccessChain %20 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                              Uniform f32_4* %138 = OpAccessChain %20 %133 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 2 3 
                                       f32_2 %141 = OpFAdd %137 %140 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %9 %143 
                                                      OpBranch %103 
                                              %97 = OpLabel 
                                       f32_3 %145 = OpLoad %86 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                              Uniform f32_4* %148 = OpAccessChain %20 %147 
                                       f32_4 %149 = OpLoad %148 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %151 = OpFMul %146 %150 
                              Uniform f32_4* %152 = OpAccessChain %20 %147 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 3 
                                       f32_2 %155 = OpFAdd %151 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 2 3 
                                                      OpStore %9 %157 
                                                      OpBranch %103 
                                              %98 = OpLabel 
                                       f32_3 %159 = OpLoad %86 
                                       f32_2 %160 = OpVectorShuffle %159 %159 0 1 
                              Uniform f32_4* %162 = OpAccessChain %20 %161 
                                       f32_4 %163 = OpLoad %162 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                                       f32_2 %165 = OpFMul %160 %164 
                              Uniform f32_4* %166 = OpAccessChain %20 %161 
                                       f32_4 %167 = OpLoad %166 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 3 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %9 %171 
                                                      OpBranch %103 
                                              %99 = OpLabel 
                                       f32_3 %173 = OpLoad %86 
                                       f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                              Uniform f32_4* %176 = OpAccessChain %20 %175 
                                       f32_4 %177 = OpLoad %176 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 1 
                                       f32_2 %179 = OpFMul %174 %178 
                              Uniform f32_4* %180 = OpAccessChain %20 %175 
                                       f32_4 %181 = OpLoad %180 
                                       f32_2 %182 = OpVectorShuffle %181 %181 2 3 
                                       f32_2 %183 = OpFAdd %179 %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 2 3 
                                                      OpStore %9 %185 
                                                      OpBranch %103 
                                             %100 = OpLabel 
                                       f32_3 %187 = OpLoad %86 
                                       f32_2 %188 = OpVectorShuffle %187 %187 0 1 
                              Uniform f32_4* %190 = OpAccessChain %20 %189 
                                       f32_4 %191 = OpLoad %190 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFMul %188 %192 
                              Uniform f32_4* %194 = OpAccessChain %20 %189 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 2 3 
                                       f32_2 %197 = OpFAdd %193 %196 
                                       f32_4 %198 = OpLoad %9 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 2 3 
                                                      OpStore %9 %199 
                                                      OpBranch %103 
                                             %101 = OpLabel 
                                       f32_3 %201 = OpLoad %86 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                              Uniform f32_4* %204 = OpAccessChain %20 %203 
                                       f32_4 %205 = OpLoad %204 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_2 %207 = OpFMul %202 %206 
                              Uniform f32_4* %208 = OpAccessChain %20 %203 
                                       f32_4 %209 = OpLoad %208 
                                       f32_2 %210 = OpVectorShuffle %209 %209 2 3 
                                       f32_2 %211 = OpFAdd %207 %210 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 2 3 
                                                      OpStore %9 %213 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                       f32_4 %224 = OpLoad %9 
                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                       f32_3 %226 = OpLoad vs_TEXCOORD0 
                                       f32_3 %227 = OpVectorShuffle %226 %225 3 4 2 
                                                      OpStore vs_TEXCOORD0 %227 
                                       f32_4 %230 = OpLoad %229 
                                                      OpStore %228 %230 
                                  Input f32* %231 = OpAccessChain %86 %87 
                                         f32 %232 = OpLoad %231 
                                 Output f32* %234 = OpAccessChain vs_TEXCOORD0 %87 
                                                      OpStore %234 %232 
                                 Output f32* %235 = OpAccessChain %72 %22 %68 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFNegate %236 
                                 Output f32* %238 = OpAccessChain %72 %22 %68 
                                                      OpStore %238 %237 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 131
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %124 %127 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 12 
                                              OpDecorate %36 DescriptorSet 36 
                                              OpDecorate %36 Binding 36 
                                              OpDecorate %40 DescriptorSet 40 
                                              OpDecorate %40 Binding 40 
                                              OpDecorate %49 DescriptorSet 49 
                                              OpDecorate %49 Binding 49 
                                              OpDecorate %51 DescriptorSet 51 
                                              OpDecorate %51 Binding 51 
                                              OpDecorate %58 DescriptorSet 58 
                                              OpDecorate %58 Binding 58 
                                              OpDecorate %60 DescriptorSet 60 
                                              OpDecorate %60 Binding 60 
                                              OpDecorate %67 DescriptorSet 67 
                                              OpDecorate %67 Binding 67 
                                              OpDecorate %69 DescriptorSet 69 
                                              OpDecorate %69 Binding 69 
                                              OpDecorate %76 DescriptorSet 76 
                                              OpDecorate %76 Binding 76 
                                              OpDecorate %78 DescriptorSet 78 
                                              OpDecorate %78 Binding 78 
                                              OpDecorate %85 DescriptorSet 85 
                                              OpDecorate %85 Binding 85 
                                              OpDecorate %87 DescriptorSet 87 
                                              OpDecorate %87 Binding 87 
                                              OpDecorate %94 DescriptorSet 94 
                                              OpDecorate %94 Binding 94 
                                              OpDecorate %96 DescriptorSet 96 
                                              OpDecorate %96 Binding 96 
                                              OpDecorate %103 DescriptorSet 103 
                                              OpDecorate %103 Binding 103 
                                              OpDecorate %105 DescriptorSet 105 
                                              OpDecorate %105 Binding 105 
                                              OpDecorate %124 Location 124 
                                              OpDecorate %127 Location 127 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeInt 32 0 
                                       %7 = OpTypePointer Private %6 
                          Private u32* %8 = OpVariable Private 
                                       %9 = OpTypeFloat 32 
                                      %10 = OpTypeVector %9 3 
                                      %11 = OpTypePointer Input %10 
                Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                  u32 %13 = OpConstant 2 
                                      %14 = OpTypePointer Input %9 
                                      %19 = OpTypeInt 32 1 
                                      %31 = OpTypeVector %9 4 
                                      %32 = OpTypePointer Private %31 
                       Private f32_4* %33 = OpVariable Private 
                                      %34 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                      %35 = OpTypePointer UniformConstant %34 
 UniformConstant read_only Texture2D* %36 = OpVariable UniformConstant 
                                      %38 = OpTypeSampler 
                                      %39 = OpTypePointer UniformConstant %38 
             UniformConstant sampler* %40 = OpVariable UniformConstant 
                                      %42 = OpTypeSampledImage %34 
                                      %44 = OpTypeVector %9 2 
 UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
             UniformConstant sampler* %51 = OpVariable UniformConstant 
 UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
             UniformConstant sampler* %60 = OpVariable UniformConstant 
 UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
             UniformConstant sampler* %69 = OpVariable UniformConstant 
 UniformConstant read_only Texture2D* %76 = OpVariable UniformConstant 
             UniformConstant sampler* %78 = OpVariable UniformConstant 
 UniformConstant read_only Texture2D* %85 = OpVariable UniformConstant 
             UniformConstant sampler* %87 = OpVariable UniformConstant 
 UniformConstant read_only Texture2D* %94 = OpVariable UniformConstant 
             UniformConstant sampler* %96 = OpVariable UniformConstant 
UniformConstant read_only Texture2D* %103 = OpVariable UniformConstant 
            UniformConstant sampler* %105 = OpVariable UniformConstant 
                                 f32 %112 = OpConstant 3.674022E-40 
                                 u32 %113 = OpConstant 0 
                                     %114 = OpTypePointer Private %9 
                                 u32 %116 = OpConstant 1 
                                 u32 %119 = OpConstant 3 
                                     %123 = OpTypePointer Output %31 
                       Output f32_4* %124 = OpVariable Output 
                                     %126 = OpTypePointer Input %31 
                        Input f32_4* %127 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                           Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                  f32 %16 = OpLoad %15 
                                  u32 %17 = OpConvertFToU %16 
                                              OpStore %8 %17 
                                  u32 %18 = OpLoad %8 
                                  i32 %20 = OpBitcast %18 
                                              OpSelectionMerge %30 None 
              OpSwitch %20 %29 { Selector = 0, Label = %21 } { Selector = 1, Label = %22 } { Selector = 2, Label = %23 } { Selector = 3, Label = %24 } { Selector = 4, Label = %25 } { Selector = 5, Label = %26 } { Selector = 6, Label = %27 } { Selector = 7, Label = %28 } 
                                      %29 = OpLabel 
                        Private f32* %115 = OpAccessChain %33 %113 
                                              OpStore %115 %112 
                        Private f32* %117 = OpAccessChain %33 %116 
                                              OpStore %117 %112 
                        Private f32* %118 = OpAccessChain %33 %13 
                                              OpStore %118 %112 
                        Private f32* %120 = OpAccessChain %33 %119 
                                              OpStore %120 %112 
                                              OpBranch %30 
                                      %21 = OpLabel 
                  read_only Texture2D %37 = OpLoad %36 
                              sampler %41 = OpLoad %40 
           read_only Texture2DSampled %43 = OpSampledImage %37 %41 
                                f32_3 %45 = OpLoad vs_TEXCOORD0 
                                f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                f32_4 %47 = OpImageSampleImplicitLod %43 %46 
                                              OpStore %33 %47 
                                              OpBranch %30 
                                      %22 = OpLabel 
                  read_only Texture2D %50 = OpLoad %49 
                              sampler %52 = OpLoad %51 
           read_only Texture2DSampled %53 = OpSampledImage %50 %52 
                                f32_3 %54 = OpLoad vs_TEXCOORD0 
                                f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                              OpStore %33 %56 
                                              OpBranch %30 
                                      %23 = OpLabel 
                  read_only Texture2D %59 = OpLoad %58 
                              sampler %61 = OpLoad %60 
           read_only Texture2DSampled %62 = OpSampledImage %59 %61 
                                f32_3 %63 = OpLoad vs_TEXCOORD0 
                                f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                              OpStore %33 %65 
                                              OpBranch %30 
                                      %24 = OpLabel 
                  read_only Texture2D %68 = OpLoad %67 
                              sampler %70 = OpLoad %69 
           read_only Texture2DSampled %71 = OpSampledImage %68 %70 
                                f32_3 %72 = OpLoad vs_TEXCOORD0 
                                f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                                              OpStore %33 %74 
                                              OpBranch %30 
                                      %25 = OpLabel 
                  read_only Texture2D %77 = OpLoad %76 
                              sampler %79 = OpLoad %78 
           read_only Texture2DSampled %80 = OpSampledImage %77 %79 
                                f32_3 %81 = OpLoad vs_TEXCOORD0 
                                f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                                f32_4 %83 = OpImageSampleImplicitLod %80 %82 
                                              OpStore %33 %83 
                                              OpBranch %30 
                                      %26 = OpLabel 
                  read_only Texture2D %86 = OpLoad %85 
                              sampler %88 = OpLoad %87 
           read_only Texture2DSampled %89 = OpSampledImage %86 %88 
                                f32_3 %90 = OpLoad vs_TEXCOORD0 
                                f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                f32_4 %92 = OpImageSampleImplicitLod %89 %91 
                                              OpStore %33 %92 
                                              OpBranch %30 
                                      %27 = OpLabel 
                  read_only Texture2D %95 = OpLoad %94 
                              sampler %97 = OpLoad %96 
           read_only Texture2DSampled %98 = OpSampledImage %95 %97 
                                f32_3 %99 = OpLoad vs_TEXCOORD0 
                               f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                               f32_4 %101 = OpImageSampleImplicitLod %98 %100 
                                              OpStore %33 %101 
                                              OpBranch %30 
                                      %28 = OpLabel 
                 read_only Texture2D %104 = OpLoad %103 
                             sampler %106 = OpLoad %105 
          read_only Texture2DSampled %107 = OpSampledImage %104 %106 
                               f32_3 %108 = OpLoad vs_TEXCOORD0 
                               f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                               f32_4 %110 = OpImageSampleImplicitLod %107 %109 
                                              OpStore %33 %110 
                                              OpBranch %30 
                                      %30 = OpLabel 
                               f32_4 %125 = OpLoad %33 
                               f32_4 %128 = OpLoad %127 
                               f32_4 %129 = OpFMul %125 %128 
                                              OpStore %124 %129 
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