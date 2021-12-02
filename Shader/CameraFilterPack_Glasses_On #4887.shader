//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Glasses_On" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 15992
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
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
 vec4 phase0_Output0_0;
out vec2 vs_TEXCOORD1;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    phase0_Output0_0 = in_TEXCOORD0.xyxy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_0.xy;
vs_TEXCOORD1 = phase0_Output0_0.zw;
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
uniform 	float _TimeX;
uniform 	float Fade;
uniform 	float VisionBlur;
uniform 	float GlassDistortion;
uniform 	float GlassAberration;
uniform 	vec4 GlassesColor;
uniform 	vec4 GlassesColor2;
uniform 	vec4 GlassColor;
uniform 	float UseFinalGlassColor;
uniform 	float UseScanLine;
uniform 	float UseScanLineSize;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
float u_xlat11;
vec3 u_xlat12;
float u_xlat16;
ivec2 u_xlati16;
vec2 u_xlat19;
vec2 u_xlat22;
float u_xlat23;
int u_xlati23;
float u_xlat30;
ivec2 u_xlati30;
float u_xlat33;
float u_xlat35;
bool u_xlatb35;
float u_xlat38;
bool u_xlatb38;
vec4 TempArray0[6];
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat22.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat1.x = (-Fade) + 1.0;
    u_xlat2.xy = u_xlat22.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat22.x = Fade + -0.699999988;
    u_xlat0.z = u_xlat22.x * 3.33333325;
    u_xlat0.z = clamp(u_xlat0.z, 0.0, 1.0);
    u_xlat33 = u_xlat0.z * -2.0 + 3.0;
    u_xlat12.xyz = vec3(Fade, Fade, _TimeX) * vec3(3.33333325, 5.0, 3.5);
    u_xlat12.xy = u_xlat12.xy;
    u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat12.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat12.xy = u_xlat12.xy * u_xlat12.xy;
    u_xlat12.x = u_xlat12.x * u_xlat3.x;
    u_xlat23 = (-u_xlat3.y) * u_xlat12.y + u_xlat2.y;
    u_xlat2.z = min(u_xlat23, 0.0);
    u_xlat2 = texture(_MainTex2, u_xlat2.xz);
    u_xlat3 = (-GlassesColor) + GlassesColor2;
    u_xlat3 = u_xlat2.yyyy * u_xlat3 + GlassesColor;
    u_xlat23 = (-u_xlat2.x) + u_xlat2.y;
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat23 = u_xlat23 + -0.5;
    u_xlat23 = u_xlat23 * GlassDistortion;
    u_xlat4.xy = (-vec2(u_xlat23)) * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
    u_xlat4 = texture(_MainTex, u_xlat4.xy);
    u_xlat35 = Fade * GlassAberration;
    u_xlat4.x = (-u_xlat35) * 0.25 + 0.200000003;
    u_xlat4.xz = (-vec2(u_xlat23)) * u_xlat4.xx + u_xlat0.xy;
    u_xlat5 = texture(_MainTex, u_xlat4.xz);
    u_xlat35 = u_xlat35 * 0.25 + 0.200000003;
    u_xlat4.xz = (-vec2(u_xlat23)) * vec2(u_xlat35) + u_xlat0.xy;
    u_xlat6 = texture(_MainTex, u_xlat4.xz);
    u_xlat7 = texture(_MainTex, u_xlat0.xy);
    TempArray0[5].x = 0.0;
    TempArray0[2].x = 0.400000006;
    TempArray0[1].x = 0.400000006;
    TempArray0[3].x = 0.400000006;
    TempArray0[0].x = 0.400000006;
    TempArray0[4].x = 0.400000006;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(0.0);
    u_xlat4.w = float(0.0);
    u_xlati23 = int(0xFFFFFFFEu);
    while(true){
        u_xlatb35 = 2<u_xlati23;
        if(u_xlatb35){break;}
        u_xlati16.xy = ivec2(u_xlati23) + ivec2(2, 1);
        u_xlat35 = TempArray0[u_xlati16.x].x;
        u_xlat16 = float(u_xlati23);
        u_xlat8.x = u_xlat16 * VisionBlur;
        u_xlat9.xyz = u_xlat4.xzw;
        u_xlati16.x = int(0xFFFFFFFEu);
        while(true){
            u_xlatb38 = 2<u_xlati16.x;
            if(u_xlatb38){break;}
            u_xlati30.xy = u_xlati16.xx + ivec2(2, 1);
            u_xlat38 = TempArray0[u_xlati30.x].x;
            u_xlat38 = u_xlat35 * u_xlat38;
            u_xlat30 = float(u_xlati16.x);
            u_xlat8.y = u_xlat30 * VisionBlur;
            u_xlat19.xy = u_xlat0.xy + u_xlat8.xy;
            u_xlat10 = texture(_MainTex, u_xlat19.xy);
            u_xlat9.xyz = vec3(u_xlat38) * u_xlat10.xyz + u_xlat9.xyz;
            u_xlati16.x = u_xlati30.y;
        }
        u_xlat4.xzw = u_xlat9.xyz;
        u_xlati23 = u_xlati16.y;
    }
    u_xlat8.xyz = u_xlat4.xzw * vec3(0.25, 0.25, 0.25);
    u_xlat8.w = 1.0;
    u_xlat8 = (-vec4(vec4(Fade, Fade, Fade, Fade))) * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003) + u_xlat8;
    u_xlat0.x = u_xlat1.x * UseScanLineSize;
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0.x = u_xlat0.x * 1.5 + u_xlat12.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.70000005;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat6.x = u_xlat5.x;
    u_xlat6.y = u_xlat4.y;
    u_xlat6.w = 1.0;
    u_xlat4 = u_xlat6 + GlassColor;
    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
    u_xlat5 = u_xlat4 * u_xlat0.xxxx + (-u_xlat4);
    u_xlat4 = vec4(vec4(UseScanLine, UseScanLine, UseScanLine, UseScanLine)) * u_xlat5 + u_xlat4;
    u_xlat5 = (-u_xlat4) + u_xlat8;
    u_xlat4 = u_xlat2.zzzz * u_xlat5 + u_xlat4;
    u_xlat0.x = u_xlat2.y + -0.100000001;
    u_xlat0.x = u_xlat0.x * 2.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz;
    u_xlat0.x = (-u_xlat11) * u_xlat0.x + 1.0;
    u_xlat3 = (-u_xlat0.xxxx) * vec4(0.800000012, 0.800000012, 0.800000012, 0.800000012) + u_xlat3;
    u_xlat3 = (-u_xlat4) + u_xlat3;
    u_xlat2 = u_xlat2.xxxx * u_xlat3 + u_xlat4;
    u_xlat2 = (-u_xlat8) + u_xlat2;
    u_xlat1 = u_xlat12.xxxx * u_xlat2 + u_xlat8;
    u_xlat2 = GlassColor * vec4(UseFinalGlassColor);
    u_xlat2 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat7;
    u_xlat0.x = (-u_xlat33) * u_xlat0.z + 1.0;
    u_xlat1 = u_xlat1 + (-u_xlat2);
    SV_Target0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %30 %58 %109 %119 %120 %123 %126 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %13 ArrayStride 13 
                                                     OpDecorate %14 ArrayStride 14 
                                                     OpMemberDecorate %16 0 Offset 16 
                                                     OpMemberDecorate %16 1 Offset 16 
                                                     OpMemberDecorate %16 2 Offset 16 
                                                     OpDecorate %16 Block 
                                                     OpDecorate %18 DescriptorSet 18 
                                                     OpDecorate %18 Binding 18 
                                                     OpDecorate %30 Location 30 
                                                     OpDecorate %58 Location 58 
                                                     OpMemberDecorate %107 0 BuiltIn 107 
                                                     OpMemberDecorate %107 1 BuiltIn 107 
                                                     OpMemberDecorate %107 2 BuiltIn 107 
                                                     OpDecorate %107 Block 
                                                     OpDecorate %119 Location 119 
                                                     OpDecorate %120 Location 120 
                                                     OpDecorate vs_TEXCOORD0 Location 123 
                                                     OpDecorate vs_TEXCOORD1 Location 126 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeBool 
                                              %7 = OpTypePointer Private %6 
                                Private bool* %8 = OpVariable Private 
                                              %9 = OpTypeFloat 32 
                                             %10 = OpTypeVector %9 4 
                                             %11 = OpTypeInt 32 0 
                                         u32 %12 = OpConstant 4 
                                             %13 = OpTypeArray %10 %12 
                                             %14 = OpTypeArray %10 %12 
                                             %15 = OpTypeVector %9 2 
                                             %16 = OpTypeStruct %13 %14 %15 
                                             %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_2;}* %18 = OpVariable Uniform 
                                             %19 = OpTypeInt 32 1 
                                         i32 %20 = OpConstant 2 
                                         u32 %21 = OpConstant 1 
                                             %22 = OpTypePointer Uniform %9 
                                         f32 %25 = OpConstant 3.674022E-40 
                                             %27 = OpTypePointer Private %9 
                                Private f32* %28 = OpVariable Private 
                                             %29 = OpTypePointer Input %15 
                                Input f32_2* %30 = OpVariable Input 
                                             %31 = OpTypePointer Input %9 
                                         f32 %35 = OpConstant 3.674022E-40 
                                             %37 = OpTypePointer Private %10 
                              Private f32_4* %38 = OpVariable Private 
                                             %40 = OpTypePointer Function %9 
                                         u32 %49 = OpConstant 3 
                                             %51 = OpTypeVector %9 3 
                              Private f32_4* %56 = OpVariable Private 
                                             %57 = OpTypePointer Input %10 
                                Input f32_4* %58 = OpVariable Input 
                                         i32 %61 = OpConstant 0 
                                         i32 %62 = OpConstant 1 
                                             %63 = OpTypePointer Uniform %10 
                                         i32 %82 = OpConstant 3 
                              Private f32_4* %86 = OpVariable Private 
                                            %106 = OpTypeArray %9 %21 
                                            %107 = OpTypeStruct %10 %9 %106 
                                            %108 = OpTypePointer Output %107 
       Output struct {f32_4; f32; f32[1];}* %109 = OpVariable Output 
                                            %117 = OpTypePointer Output %10 
                              Output f32_4* %119 = OpVariable Output 
                               Input f32_4* %120 = OpVariable Input 
                                            %122 = OpTypePointer Output %15 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                            %129 = OpTypePointer Output %9 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %41 = OpVariable Function 
                                Uniform f32* %23 = OpAccessChain %18 %20 %21 
                                         f32 %24 = OpLoad %23 
                                        bool %26 = OpFOrdLessThan %24 %25 
                                                     OpStore %8 %26 
                                  Input f32* %32 = OpAccessChain %30 %21 
                                         f32 %33 = OpLoad %32 
                                         f32 %34 = OpFNegate %33 
                                         f32 %36 = OpFAdd %34 %35 
                                                     OpStore %28 %36 
                                        bool %39 = OpLoad %8 
                                                     OpSelectionMerge %43 None 
                                                     OpBranchConditional %39 %42 %45 
                                             %42 = OpLabel 
                                         f32 %44 = OpLoad %28 
                                                     OpStore %41 %44 
                                                     OpBranch %43 
                                             %45 = OpLabel 
                                  Input f32* %46 = OpAccessChain %30 %21 
                                         f32 %47 = OpLoad %46 
                                                     OpStore %41 %47 
                                                     OpBranch %43 
                                             %43 = OpLabel 
                                         f32 %48 = OpLoad %41 
                                Private f32* %50 = OpAccessChain %38 %49 
                                                     OpStore %50 %48 
                                       f32_2 %52 = OpLoad %30 
                                       f32_3 %53 = OpVectorShuffle %52 %52 0 1 0 
                                       f32_4 %54 = OpLoad %38 
                                       f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                                     OpStore %38 %55 
                                       f32_4 %59 = OpLoad %58 
                                       f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                              Uniform f32_4* %64 = OpAccessChain %18 %61 %62 
                                       f32_4 %65 = OpLoad %64 
                                       f32_4 %66 = OpFMul %60 %65 
                                                     OpStore %56 %66 
                              Uniform f32_4* %67 = OpAccessChain %18 %61 %61 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %58 
                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %56 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %56 %73 
                              Uniform f32_4* %74 = OpAccessChain %18 %61 %20 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %58 
                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %56 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %56 %80 
                                       f32_4 %81 = OpLoad %56 
                              Uniform f32_4* %83 = OpAccessChain %18 %61 %82 
                                       f32_4 %84 = OpLoad %83 
                                       f32_4 %85 = OpFAdd %81 %84 
                                                     OpStore %56 %85 
                                       f32_4 %87 = OpLoad %56 
                                       f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
                              Uniform f32_4* %89 = OpAccessChain %18 %62 %62 
                                       f32_4 %90 = OpLoad %89 
                                       f32_4 %91 = OpFMul %88 %90 
                                                     OpStore %86 %91 
                              Uniform f32_4* %92 = OpAccessChain %18 %62 %61 
                                       f32_4 %93 = OpLoad %92 
                                       f32_4 %94 = OpLoad %56 
                                       f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
                                       f32_4 %96 = OpFMul %93 %95 
                                       f32_4 %97 = OpLoad %86 
                                       f32_4 %98 = OpFAdd %96 %97 
                                                     OpStore %86 %98 
                              Uniform f32_4* %99 = OpAccessChain %18 %62 %20 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %56 
                                      f32_4 %102 = OpVectorShuffle %101 %101 2 2 2 2 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %86 
                                      f32_4 %105 = OpFAdd %103 %104 
                                                     OpStore %86 %105 
                             Uniform f32_4* %110 = OpAccessChain %18 %62 %82 
                                      f32_4 %111 = OpLoad %110 
                                      f32_4 %112 = OpLoad %56 
                                      f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                      f32_4 %114 = OpFMul %111 %113 
                                      f32_4 %115 = OpLoad %86 
                                      f32_4 %116 = OpFAdd %114 %115 
                              Output f32_4* %118 = OpAccessChain %109 %61 
                                                     OpStore %118 %116 
                                      f32_4 %121 = OpLoad %120 
                                                     OpStore %119 %121 
                                      f32_4 %124 = OpLoad %38 
                                      f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                                     OpStore vs_TEXCOORD0 %125 
                                      f32_4 %127 = OpLoad %38 
                                      f32_2 %128 = OpVectorShuffle %127 %127 2 3 
                                                     OpStore vs_TEXCOORD1 %128 
                                Output f32* %130 = OpAccessChain %109 %61 %21 
                                        f32 %131 = OpLoad %130 
                                        f32 %132 = OpFNegate %131 
                                Output f32* %133 = OpAccessChain %109 %61 %21 
                                                     OpStore %133 %132 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 609
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %33 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate vs_TEXCOORD1 Location 33 
                                                      OpDecorate %146 DescriptorSet 146 
                                                      OpDecorate %146 Binding 146 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %202 DescriptorSet 202 
                                                      OpDecorate %202 Binding 202 
                                                      OpDecorate %204 DescriptorSet 204 
                                                      OpDecorate %204 Binding 204 
                                                      OpDecorate %601 Location 601 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %14 %14 %14 %6 %6 %6 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4; f32_4; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 11 
                                              %20 = OpTypePointer Uniform %14 
                                              %31 = OpTypePointer Private %10 
                               Private f32_2* %32 = OpVariable Private 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                          f32 %35 = OpConstant 3.674022E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                                              %38 = OpTypePointer Private %14 
                               Private f32_4* %39 = OpVariable Private 
                                          i32 %40 = OpConstant 1 
                                              %41 = OpTypePointer Uniform %6 
                                          f32 %45 = OpConstant 3.674022E-40 
                                              %47 = OpTypeInt 32 0 
                                          u32 %48 = OpConstant 0 
                                              %49 = OpTypePointer Private %6 
                               Private f32_4* %51 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                        f32_2 %57 = OpConstantComposite %56 %56 
                                          f32 %63 = OpConstant 3.674022E-40 
                                          f32 %68 = OpConstant 3.674022E-40 
                                          u32 %70 = OpConstant 2 
                                          f32 %74 = OpConstant 3.674022E-40 
                                 Private f32* %77 = OpVariable Private 
                                          f32 %80 = OpConstant 3.674022E-40 
                                          f32 %82 = OpConstant 3.674022E-40 
                               Private f32_3* %84 = OpVariable Private 
                                          i32 %89 = OpConstant 0 
                                          f32 %93 = OpConstant 3.674022E-40 
                                          f32 %94 = OpConstant 3.674022E-40 
                                        f32_3 %95 = OpConstantComposite %68 %93 %94 
                              Private f32_4* %108 = OpVariable Private 
                                       f32_2 %111 = OpConstantComposite %80 %80 
                                       f32_2 %113 = OpConstantComposite %82 %82 
                                Private f32* %130 = OpVariable Private 
                                         u32 %131 = OpConstant 1 
                                             %144 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %145 = OpTypePointer UniformConstant %144 
        UniformConstant read_only Texture2D* %146 = OpVariable UniformConstant 
                                             %148 = OpTypeSampler 
                                             %149 = OpTypePointer UniformConstant %148 
                    UniformConstant sampler* %150 = OpVariable UniformConstant 
                                             %152 = OpTypeSampledImage %144 
                                         i32 %160 = OpConstant 5 
                                         i32 %164 = OpConstant 6 
                                         i32 %186 = OpConstant 3 
                              Private f32_4* %190 = OpVariable Private 
                                         f32 %194 = OpConstant 3.674022E-40 
                                       f32_2 %195 = OpConstantComposite %194 %194 
        UniformConstant read_only Texture2D* %202 = OpVariable UniformConstant 
                    UniformConstant sampler* %204 = OpVariable UniformConstant 
                                Private f32* %212 = OpVariable Private 
                                         i32 %215 = OpConstant 4 
                              Private f32_4* %219 = OpVariable Private 
                                         f32 %222 = OpConstant 3.674022E-40 
                                         u32 %273 = OpConstant 6 
                                             %274 = OpTypeArray %14 %273 
                                             %275 = OpTypePointer Private %274 
                           Private f32_4[6]* %276 = OpVariable Private 
                                         i32 %278 = OpConstant 2 
                                         f32 %279 = OpConstant 3.674022E-40 
                              Private f32_4* %285 = OpVariable Private 
                                             %289 = OpTypePointer Private %18 
                                Private i32* %290 = OpVariable Private 
                                         i32 %291 = OpConstant -2 
                                             %297 = OpTypeBool 
                                        bool %298 = OpConstantTrue 
                                             %299 = OpTypePointer Private %297 
                               Private bool* %300 = OpVariable Private 
                                             %307 = OpTypeVector %18 2 
                                             %308 = OpTypePointer Private %307 
                              Private i32_2* %309 = OpVariable Private 
                                       i32_2 %312 = OpConstantComposite %278 %40 
                                Private f32* %318 = OpVariable Private 
                              Private f32_2* %321 = OpVariable Private 
                              Private f32_4* %327 = OpVariable Private 
                                Private i32* %332 = OpVariable Private 
                               Private bool* %338 = OpVariable Private 
                              Private i32_2* %345 = OpVariable Private 
                                Private f32* %349 = OpVariable Private 
                              Private f32_3* %357 = OpVariable Private 
                                       f32_3 %399 = OpConstantComposite %222 %222 %222 
                                         u32 %403 = OpConstant 3 
                                       f32_4 %420 = OpConstantComposite %194 %194 %194 %194 
                                         i32 %426 = OpConstant 10 
                                         f32 %439 = OpConstant 3.674022E-40 
                                         f32 %451 = OpConstant 3.674022E-40 
                                         f32 %461 = OpConstant 3.674022E-40 
                                         i32 %470 = OpConstant 7 
                                         f32 %476 = OpConstant 3.674022E-40 
                                         i32 %487 = OpConstant 9 
                                         f32 %518 = OpConstant 3.674022E-40 
                                         f32 %523 = OpConstant 3.674022E-40 
                                Private f32* %530 = OpVariable Private 
                                         f32 %552 = OpConstant 3.674022E-40 
                                       f32_4 %553 = OpConstantComposite %552 %552 %552 %552 
                                         i32 %579 = OpConstant 8 
                                       f32_4 %585 = OpConstantComposite %56 %56 %56 %56 
                                             %600 = OpTypePointer Output %14 
                               Output f32_4* %601 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFMul %13 %23 
                               Uniform f32_4* %25 = OpAccessChain %17 %19 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                        f32_2 %28 = OpFAdd %24 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_2 %34 = OpLoad vs_TEXCOORD1 
                                        f32_2 %37 = OpFAdd %34 %36 
                                                      OpStore %32 %37 
                                 Uniform f32* %42 = OpAccessChain %17 %40 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %46 = OpFAdd %44 %45 
                                 Private f32* %50 = OpAccessChain %39 %48 
                                                      OpStore %50 %46 
                                        f32_2 %52 = OpLoad %32 
                                        f32_4 %53 = OpLoad %39 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 0 
                                        f32_2 %55 = OpFMul %52 %54 
                                        f32_2 %58 = OpFAdd %55 %57 
                                        f32_4 %59 = OpLoad %51 
                                        f32_4 %60 = OpVectorShuffle %59 %58 4 5 2 3 
                                                      OpStore %51 %60 
                                 Uniform f32* %61 = OpAccessChain %17 %40 
                                          f32 %62 = OpLoad %61 
                                          f32 %64 = OpFAdd %62 %63 
                                 Private f32* %65 = OpAccessChain %32 %48 
                                                      OpStore %65 %64 
                                 Private f32* %66 = OpAccessChain %32 %48 
                                          f32 %67 = OpLoad %66 
                                          f32 %69 = OpFMul %67 %68 
                                 Private f32* %71 = OpAccessChain %9 %70 
                                                      OpStore %71 %69 
                                 Private f32* %72 = OpAccessChain %9 %70 
                                          f32 %73 = OpLoad %72 
                                          f32 %75 = OpExtInst %1 43 %73 %74 %45 
                                 Private f32* %76 = OpAccessChain %9 %70 
                                                      OpStore %76 %75 
                                 Private f32* %78 = OpAccessChain %9 %70 
                                          f32 %79 = OpLoad %78 
                                          f32 %81 = OpFMul %79 %80 
                                          f32 %83 = OpFAdd %81 %82 
                                                      OpStore %77 %83 
                                 Uniform f32* %85 = OpAccessChain %17 %40 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %87 = OpAccessChain %17 %40 
                                          f32 %88 = OpLoad %87 
                                 Uniform f32* %90 = OpAccessChain %17 %89 
                                          f32 %91 = OpLoad %90 
                                        f32_3 %92 = OpCompositeConstruct %86 %88 %91 
                                        f32_3 %96 = OpFMul %92 %95 
                                                      OpStore %84 %96 
                                        f32_3 %97 = OpLoad %84 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_3 %99 = OpLoad %84 
                                       f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
                                                      OpStore %84 %100 
                                       f32_3 %101 = OpLoad %84 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpCompositeConstruct %74 %74 
                                       f32_2 %104 = OpCompositeConstruct %45 %45 
                                       f32_2 %105 = OpExtInst %1 43 %102 %103 %104 
                                       f32_3 %106 = OpLoad %84 
                                       f32_3 %107 = OpVectorShuffle %106 %105 3 4 2 
                                                      OpStore %84 %107 
                                       f32_3 %109 = OpLoad %84 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_2 %112 = OpFMul %110 %111 
                                       f32_2 %114 = OpFAdd %112 %113 
                                       f32_4 %115 = OpLoad %108 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 3 
                                                      OpStore %108 %116 
                                       f32_3 %117 = OpLoad %84 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_3 %119 = OpLoad %84 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_2 %121 = OpFMul %118 %120 
                                       f32_3 %122 = OpLoad %84 
                                       f32_3 %123 = OpVectorShuffle %122 %121 3 4 2 
                                                      OpStore %84 %123 
                                Private f32* %124 = OpAccessChain %84 %48 
                                         f32 %125 = OpLoad %124 
                                Private f32* %126 = OpAccessChain %108 %48 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFMul %125 %127 
                                Private f32* %129 = OpAccessChain %84 %48 
                                                      OpStore %129 %128 
                                Private f32* %132 = OpAccessChain %108 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFNegate %133 
                                Private f32* %135 = OpAccessChain %84 %131 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %134 %136 
                                Private f32* %138 = OpAccessChain %51 %131 
                                         f32 %139 = OpLoad %138 
                                         f32 %140 = OpFAdd %137 %139 
                                                      OpStore %130 %140 
                                         f32 %141 = OpLoad %130 
                                         f32 %142 = OpExtInst %1 37 %141 %74 
                                Private f32* %143 = OpAccessChain %51 %70 
                                                      OpStore %143 %142 
                         read_only Texture2D %147 = OpLoad %146 
                                     sampler %151 = OpLoad %150 
                  read_only Texture2DSampled %153 = OpSampledImage %147 %151 
                                       f32_4 %154 = OpLoad %51 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 2 
                                       f32_4 %156 = OpImageSampleImplicitLod %153 %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_4 %158 = OpLoad %51 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                      OpStore %51 %159 
                              Uniform f32_4* %161 = OpAccessChain %17 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFNegate %162 
                              Uniform f32_4* %165 = OpAccessChain %17 %164 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFAdd %163 %166 
                                                      OpStore %108 %167 
                                       f32_4 %168 = OpLoad %51 
                                       f32_4 %169 = OpVectorShuffle %168 %168 1 1 1 1 
                                       f32_4 %170 = OpLoad %108 
                                       f32_4 %171 = OpFMul %169 %170 
                              Uniform f32_4* %172 = OpAccessChain %17 %160 
                                       f32_4 %173 = OpLoad %172 
                                       f32_4 %174 = OpFAdd %171 %173 
                                                      OpStore %108 %174 
                                Private f32* %175 = OpAccessChain %51 %48 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFNegate %176 
                                Private f32* %178 = OpAccessChain %51 %131 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFAdd %177 %179 
                                                      OpStore %130 %180 
                                         f32 %181 = OpLoad %130 
                                         f32 %182 = OpExtInst %1 43 %181 %74 %45 
                                                      OpStore %130 %182 
                                         f32 %183 = OpLoad %130 
                                         f32 %184 = OpFAdd %183 %35 
                                                      OpStore %130 %184 
                                         f32 %185 = OpLoad %130 
                                Uniform f32* %187 = OpAccessChain %17 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %185 %188 
                                                      OpStore %130 %189 
                                         f32 %191 = OpLoad %130 
                                       f32_2 %192 = OpCompositeConstruct %191 %191 
                                       f32_2 %193 = OpFNegate %192 
                                       f32_2 %196 = OpFMul %193 %195 
                                       f32_3 %197 = OpLoad %9 
                                       f32_2 %198 = OpVectorShuffle %197 %197 0 1 
                                       f32_2 %199 = OpFAdd %196 %198 
                                       f32_4 %200 = OpLoad %190 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 2 3 
                                                      OpStore %190 %201 
                         read_only Texture2D %203 = OpLoad %202 
                                     sampler %205 = OpLoad %204 
                  read_only Texture2DSampled %206 = OpSampledImage %203 %205 
                                       f32_4 %207 = OpLoad %190 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_4 %209 = OpImageSampleImplicitLod %206 %208 
                                         f32 %210 = OpCompositeExtract %209 1 
                                Private f32* %211 = OpAccessChain %190 %131 
                                                      OpStore %211 %210 
                                Uniform f32* %213 = OpAccessChain %17 %40 
                                         f32 %214 = OpLoad %213 
                                Uniform f32* %216 = OpAccessChain %17 %215 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFMul %214 %217 
                                                      OpStore %212 %218 
                                         f32 %220 = OpLoad %212 
                                         f32 %221 = OpFNegate %220 
                                         f32 %223 = OpFMul %221 %222 
                                         f32 %224 = OpFAdd %223 %194 
                                Private f32* %225 = OpAccessChain %219 %48 
                                                      OpStore %225 %224 
                                         f32 %226 = OpLoad %130 
                                       f32_2 %227 = OpCompositeConstruct %226 %226 
                                       f32_2 %228 = OpFNegate %227 
                                       f32_4 %229 = OpLoad %219 
                                       f32_2 %230 = OpVectorShuffle %229 %229 0 0 
                                       f32_2 %231 = OpFMul %228 %230 
                                       f32_3 %232 = OpLoad %9 
                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
                                       f32_2 %234 = OpFAdd %231 %233 
                                       f32_4 %235 = OpLoad %219 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
                                                      OpStore %219 %236 
                         read_only Texture2D %237 = OpLoad %202 
                                     sampler %238 = OpLoad %204 
                  read_only Texture2DSampled %239 = OpSampledImage %237 %238 
                                       f32_4 %240 = OpLoad %219 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
                                       f32_4 %242 = OpImageSampleImplicitLod %239 %241 
                                         f32 %243 = OpCompositeExtract %242 0 
                                Private f32* %244 = OpAccessChain %190 %48 
                                                      OpStore %244 %243 
                                         f32 %245 = OpLoad %212 
                                         f32 %246 = OpFMul %245 %222 
                                         f32 %247 = OpFAdd %246 %194 
                                                      OpStore %212 %247 
                                         f32 %248 = OpLoad %130 
                                       f32_2 %249 = OpCompositeConstruct %248 %248 
                                       f32_2 %250 = OpFNegate %249 
                                         f32 %251 = OpLoad %212 
                                       f32_2 %252 = OpCompositeConstruct %251 %251 
                                       f32_2 %253 = OpFMul %250 %252 
                                       f32_3 %254 = OpLoad %9 
                                       f32_2 %255 = OpVectorShuffle %254 %254 0 1 
                                       f32_2 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %219 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 2 3 
                                                      OpStore %219 %258 
                         read_only Texture2D %259 = OpLoad %202 
                                     sampler %260 = OpLoad %204 
                  read_only Texture2DSampled %261 = OpSampledImage %259 %260 
                                       f32_4 %262 = OpLoad %219 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_4 %264 = OpImageSampleImplicitLod %261 %263 
                                         f32 %265 = OpCompositeExtract %264 2 
                                Private f32* %266 = OpAccessChain %190 %70 
                                                      OpStore %266 %265 
                         read_only Texture2D %267 = OpLoad %202 
                                     sampler %268 = OpLoad %204 
                  read_only Texture2DSampled %269 = OpSampledImage %267 %268 
                                       f32_3 %270 = OpLoad %9 
                                       f32_2 %271 = OpVectorShuffle %270 %270 0 1 
                                       f32_4 %272 = OpImageSampleImplicitLod %269 %271 
                                                      OpStore %219 %272 
                                Private f32* %277 = OpAccessChain %276 %160 %48 
                                                      OpStore %277 %74 
                                Private f32* %280 = OpAccessChain %276 %278 %48 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %276 %40 %48 
                                                      OpStore %281 %279 
                                Private f32* %282 = OpAccessChain %276 %186 %48 
                                                      OpStore %282 %279 
                                Private f32* %283 = OpAccessChain %276 %89 %48 
                                                      OpStore %283 %279 
                                Private f32* %284 = OpAccessChain %276 %215 %48 
                                                      OpStore %284 %279 
                                Private f32* %286 = OpAccessChain %285 %48 
                                                      OpStore %286 %74 
                                Private f32* %287 = OpAccessChain %285 %131 
                                                      OpStore %287 %74 
                                Private f32* %288 = OpAccessChain %285 %70 
                                                      OpStore %288 %74 
                                                      OpStore %290 %291 
                                                      OpBranch %292 
                                             %292 = OpLabel 
                                                      OpLoopMerge %294 %295 None 
                                                      OpBranch %296 
                                             %296 = OpLabel 
                                                      OpBranchConditional %298 %293 %294 
                                             %293 = OpLabel 
                                         i32 %301 = OpLoad %290 
                                        bool %302 = OpSLessThan %278 %301 
                                                      OpStore %300 %302 
                                        bool %303 = OpLoad %300 
                                                      OpSelectionMerge %305 None 
                                                      OpBranchConditional %303 %304 %305 
                                             %304 = OpLabel 
                                                      OpBranch %294 
                                             %305 = OpLabel 
                                         i32 %310 = OpLoad %290 
                                       i32_2 %311 = OpCompositeConstruct %310 %310 
                                       i32_2 %313 = OpIAdd %311 %312 
                                                      OpStore %309 %313 
                                Private i32* %314 = OpAccessChain %309 %48 
                                         i32 %315 = OpLoad %314 
                                Private f32* %316 = OpAccessChain %276 %315 %48 
                                         f32 %317 = OpLoad %316 
                                                      OpStore %212 %317 
                                         i32 %319 = OpLoad %290 
                                         f32 %320 = OpConvertSToF %319 
                                                      OpStore %318 %320 
                                         f32 %322 = OpLoad %318 
                                Uniform f32* %323 = OpAccessChain %17 %278 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFMul %322 %324 
                                Private f32* %326 = OpAccessChain %321 %48 
                                                      OpStore %326 %325 
                                       f32_4 %328 = OpLoad %285 
                                       f32_3 %329 = OpVectorShuffle %328 %328 0 1 2 
                                       f32_4 %330 = OpLoad %327 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 1 5 6 
                                                      OpStore %327 %331 
                                                      OpStore %332 %291 
                                                      OpBranch %333 
                                             %333 = OpLabel 
                                                      OpLoopMerge %335 %336 None 
                                                      OpBranch %337 
                                             %337 = OpLabel 
                                                      OpBranchConditional %298 %334 %335 
                                             %334 = OpLabel 
                                         i32 %339 = OpLoad %332 
                                        bool %340 = OpSLessThan %278 %339 
                                                      OpStore %338 %340 
                                        bool %341 = OpLoad %338 
                                                      OpSelectionMerge %343 None 
                                                      OpBranchConditional %341 %342 %343 
                                             %342 = OpLabel 
                                                      OpBranch %335 
                                             %343 = OpLabel 
                                         i32 %346 = OpLoad %332 
                                       i32_2 %347 = OpCompositeConstruct %346 %346 
                                       i32_2 %348 = OpIAdd %347 %312 
                                                      OpStore %345 %348 
                                Private i32* %350 = OpAccessChain %345 %48 
                                         i32 %351 = OpLoad %350 
                                Private f32* %352 = OpAccessChain %276 %351 %48 
                                         f32 %353 = OpLoad %352 
                                                      OpStore %349 %353 
                                         f32 %354 = OpLoad %212 
                                         f32 %355 = OpLoad %349 
                                         f32 %356 = OpFMul %354 %355 
                                                      OpStore %349 %356 
                                         i32 %358 = OpLoad %332 
                                         f32 %359 = OpConvertSToF %358 
                                Private f32* %360 = OpAccessChain %357 %48 
                                                      OpStore %360 %359 
                                Private f32* %361 = OpAccessChain %357 %48 
                                         f32 %362 = OpLoad %361 
                                Uniform f32* %363 = OpAccessChain %17 %278 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFMul %362 %364 
                                Private f32* %366 = OpAccessChain %321 %131 
                                                      OpStore %366 %365 
                                       f32_3 %367 = OpLoad %9 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 1 
                                       f32_2 %369 = OpLoad %321 
                                       f32_2 %370 = OpFAdd %368 %369 
                                       f32_3 %371 = OpLoad %357 
                                       f32_3 %372 = OpVectorShuffle %371 %370 3 4 2 
                                                      OpStore %357 %372 
                         read_only Texture2D %373 = OpLoad %202 
                                     sampler %374 = OpLoad %204 
                  read_only Texture2DSampled %375 = OpSampledImage %373 %374 
                                       f32_3 %376 = OpLoad %357 
                                       f32_2 %377 = OpVectorShuffle %376 %376 0 1 
                                       f32_4 %378 = OpImageSampleImplicitLod %375 %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                                      OpStore %357 %379 
                                         f32 %380 = OpLoad %349 
                                       f32_3 %381 = OpCompositeConstruct %380 %380 %380 
                                       f32_3 %382 = OpLoad %357 
                                       f32_3 %383 = OpFMul %381 %382 
                                       f32_4 %384 = OpLoad %327 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 2 3 
                                       f32_3 %386 = OpFAdd %383 %385 
                                       f32_4 %387 = OpLoad %327 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 1 5 6 
                                                      OpStore %327 %388 
                                Private i32* %389 = OpAccessChain %345 %131 
                                         i32 %390 = OpLoad %389 
                                                      OpStore %332 %390 
                                                      OpBranch %336 
                                             %336 = OpLabel 
                                                      OpBranch %333 
                                             %335 = OpLabel 
                                       f32_4 %391 = OpLoad %327 
                                       f32_3 %392 = OpVectorShuffle %391 %391 0 2 3 
                                       f32_4 %393 = OpLoad %285 
                                       f32_4 %394 = OpVectorShuffle %393 %392 4 5 6 3 
                                                      OpStore %285 %394 
                                Private i32* %395 = OpAccessChain %309 %131 
                                         i32 %396 = OpLoad %395 
                                                      OpStore %290 %396 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                                      OpBranch %292 
                                             %294 = OpLabel 
                                       f32_4 %397 = OpLoad %285 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_3 %400 = OpFMul %398 %399 
                                       f32_4 %401 = OpLoad %285 
                                       f32_4 %402 = OpVectorShuffle %401 %400 4 5 6 3 
                                                      OpStore %285 %402 
                                Private f32* %404 = OpAccessChain %285 %403 
                                                      OpStore %404 %45 
                                Uniform f32* %405 = OpAccessChain %17 %40 
                                         f32 %406 = OpLoad %405 
                                Uniform f32* %407 = OpAccessChain %17 %40 
                                         f32 %408 = OpLoad %407 
                                Uniform f32* %409 = OpAccessChain %17 %40 
                                         f32 %410 = OpLoad %409 
                                Uniform f32* %411 = OpAccessChain %17 %40 
                                         f32 %412 = OpLoad %411 
                                       f32_4 %413 = OpCompositeConstruct %406 %408 %410 %412 
                                         f32 %414 = OpCompositeExtract %413 0 
                                         f32 %415 = OpCompositeExtract %413 1 
                                         f32 %416 = OpCompositeExtract %413 2 
                                         f32 %417 = OpCompositeExtract %413 3 
                                       f32_4 %418 = OpCompositeConstruct %414 %415 %416 %417 
                                       f32_4 %419 = OpFNegate %418 
                                       f32_4 %421 = OpFMul %419 %420 
                                       f32_4 %422 = OpLoad %285 
                                       f32_4 %423 = OpFAdd %421 %422 
                                                      OpStore %285 %423 
                                Private f32* %424 = OpAccessChain %39 %48 
                                         f32 %425 = OpLoad %424 
                                Uniform f32* %427 = OpAccessChain %17 %426 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpFMul %425 %428 
                                Private f32* %430 = OpAccessChain %9 %48 
                                                      OpStore %430 %429 
                                Private f32* %431 = OpAccessChain %9 %48 
                                         f32 %432 = OpLoad %431 
                                Private f32* %433 = OpAccessChain %9 %131 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFMul %432 %434 
                                Private f32* %436 = OpAccessChain %9 %48 
                                                      OpStore %436 %435 
                                Private f32* %437 = OpAccessChain %9 %48 
                                         f32 %438 = OpLoad %437 
                                         f32 %440 = OpFMul %438 %439 
                                Private f32* %441 = OpAccessChain %84 %70 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpFAdd %440 %442 
                                Private f32* %444 = OpAccessChain %9 %48 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %9 %48 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpExtInst %1 13 %446 
                                Private f32* %448 = OpAccessChain %9 %48 
                                                      OpStore %448 %447 
                                Private f32* %449 = OpAccessChain %9 %48 
                                         f32 %450 = OpLoad %449 
                                         f32 %452 = OpFMul %450 %451 
                                         f32 %453 = OpFAdd %452 %451 
                                Private f32* %454 = OpAccessChain %9 %48 
                                                      OpStore %454 %453 
                                Private f32* %455 = OpAccessChain %9 %48 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpExtInst %1 30 %456 
                                Private f32* %458 = OpAccessChain %9 %48 
                                                      OpStore %458 %457 
                                Private f32* %459 = OpAccessChain %9 %48 
                                         f32 %460 = OpLoad %459 
                                         f32 %462 = OpFMul %460 %461 
                                Private f32* %463 = OpAccessChain %9 %48 
                                                      OpStore %463 %462 
                                Private f32* %464 = OpAccessChain %9 %48 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpExtInst %1 29 %465 
                                Private f32* %467 = OpAccessChain %9 %48 
                                                      OpStore %467 %466 
                                Private f32* %468 = OpAccessChain %190 %403 
                                                      OpStore %468 %45 
                                       f32_4 %469 = OpLoad %190 
                              Uniform f32_4* %471 = OpAccessChain %17 %470 
                                       f32_4 %472 = OpLoad %471 
                                       f32_4 %473 = OpFAdd %469 %472 
                                                      OpStore %190 %473 
                                Private f32* %474 = OpAccessChain %9 %48 
                                         f32 %475 = OpLoad %474 
                                         f32 %477 = OpFMul %475 %476 
                                         f32 %478 = OpFAdd %477 %279 
                                Private f32* %479 = OpAccessChain %9 %48 
                                                      OpStore %479 %478 
                                       f32_4 %480 = OpLoad %190 
                                       f32_3 %481 = OpLoad %9 
                                       f32_4 %482 = OpVectorShuffle %481 %481 0 0 0 0 
                                       f32_4 %483 = OpFMul %480 %482 
                                       f32_4 %484 = OpLoad %190 
                                       f32_4 %485 = OpFNegate %484 
                                       f32_4 %486 = OpFAdd %483 %485 
                                                      OpStore %327 %486 
                                Uniform f32* %488 = OpAccessChain %17 %487 
                                         f32 %489 = OpLoad %488 
                                Uniform f32* %490 = OpAccessChain %17 %487 
                                         f32 %491 = OpLoad %490 
                                Uniform f32* %492 = OpAccessChain %17 %487 
                                         f32 %493 = OpLoad %492 
                                Uniform f32* %494 = OpAccessChain %17 %487 
                                         f32 %495 = OpLoad %494 
                                       f32_4 %496 = OpCompositeConstruct %489 %491 %493 %495 
                                         f32 %497 = OpCompositeExtract %496 0 
                                         f32 %498 = OpCompositeExtract %496 1 
                                         f32 %499 = OpCompositeExtract %496 2 
                                         f32 %500 = OpCompositeExtract %496 3 
                                       f32_4 %501 = OpCompositeConstruct %497 %498 %499 %500 
                                       f32_4 %502 = OpLoad %327 
                                       f32_4 %503 = OpFMul %501 %502 
                                       f32_4 %504 = OpLoad %190 
                                       f32_4 %505 = OpFAdd %503 %504 
                                                      OpStore %190 %505 
                                       f32_4 %506 = OpLoad %190 
                                       f32_4 %507 = OpFNegate %506 
                                       f32_4 %508 = OpLoad %285 
                                       f32_4 %509 = OpFAdd %507 %508 
                                                      OpStore %327 %509 
                                       f32_4 %510 = OpLoad %51 
                                       f32_4 %511 = OpVectorShuffle %510 %510 2 2 2 2 
                                       f32_4 %512 = OpLoad %327 
                                       f32_4 %513 = OpFMul %511 %512 
                                       f32_4 %514 = OpLoad %190 
                                       f32_4 %515 = OpFAdd %513 %514 
                                                      OpStore %190 %515 
                                Private f32* %516 = OpAccessChain %51 %131 
                                         f32 %517 = OpLoad %516 
                                         f32 %519 = OpFAdd %517 %518 
                                Private f32* %520 = OpAccessChain %9 %48 
                                                      OpStore %520 %519 
                                Private f32* %521 = OpAccessChain %9 %48 
                                         f32 %522 = OpLoad %521 
                                         f32 %524 = OpFMul %522 %523 
                                Private f32* %525 = OpAccessChain %9 %48 
                                                      OpStore %525 %524 
                                Private f32* %526 = OpAccessChain %9 %48 
                                         f32 %527 = OpLoad %526 
                                         f32 %528 = OpExtInst %1 43 %527 %74 %45 
                                Private f32* %529 = OpAccessChain %9 %48 
                                                      OpStore %529 %528 
                                Private f32* %531 = OpAccessChain %9 %48 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpFMul %532 %80 
                                         f32 %534 = OpFAdd %533 %82 
                                                      OpStore %530 %534 
                                       f32_3 %535 = OpLoad %9 
                                       f32_2 %536 = OpVectorShuffle %535 %535 0 2 
                                       f32_3 %537 = OpLoad %9 
                                       f32_2 %538 = OpVectorShuffle %537 %537 0 2 
                                       f32_2 %539 = OpFMul %536 %538 
                                       f32_3 %540 = OpLoad %9 
                                       f32_3 %541 = OpVectorShuffle %540 %539 3 1 4 
                                                      OpStore %9 %541 
                                         f32 %542 = OpLoad %530 
                                         f32 %543 = OpFNegate %542 
                                Private f32* %544 = OpAccessChain %9 %48 
                                         f32 %545 = OpLoad %544 
                                         f32 %546 = OpFMul %543 %545 
                                         f32 %547 = OpFAdd %546 %45 
                                Private f32* %548 = OpAccessChain %9 %48 
                                                      OpStore %548 %547 
                                       f32_3 %549 = OpLoad %9 
                                       f32_4 %550 = OpVectorShuffle %549 %549 0 0 0 0 
                                       f32_4 %551 = OpFNegate %550 
                                       f32_4 %554 = OpFMul %551 %553 
                                       f32_4 %555 = OpLoad %108 
                                       f32_4 %556 = OpFAdd %554 %555 
                                                      OpStore %108 %556 
                                       f32_4 %557 = OpLoad %190 
                                       f32_4 %558 = OpFNegate %557 
                                       f32_4 %559 = OpLoad %108 
                                       f32_4 %560 = OpFAdd %558 %559 
                                                      OpStore %108 %560 
                                       f32_4 %561 = OpLoad %51 
                                       f32_4 %562 = OpVectorShuffle %561 %561 0 0 0 0 
                                       f32_4 %563 = OpLoad %108 
                                       f32_4 %564 = OpFMul %562 %563 
                                       f32_4 %565 = OpLoad %190 
                                       f32_4 %566 = OpFAdd %564 %565 
                                                      OpStore %51 %566 
                                       f32_4 %567 = OpLoad %285 
                                       f32_4 %568 = OpFNegate %567 
                                       f32_4 %569 = OpLoad %51 
                                       f32_4 %570 = OpFAdd %568 %569 
                                                      OpStore %51 %570 
                                       f32_3 %571 = OpLoad %84 
                                       f32_4 %572 = OpVectorShuffle %571 %571 0 0 0 0 
                                       f32_4 %573 = OpLoad %51 
                                       f32_4 %574 = OpFMul %572 %573 
                                       f32_4 %575 = OpLoad %285 
                                       f32_4 %576 = OpFAdd %574 %575 
                                                      OpStore %39 %576 
                              Uniform f32_4* %577 = OpAccessChain %17 %470 
                                       f32_4 %578 = OpLoad %577 
                                Uniform f32* %580 = OpAccessChain %17 %579 
                                         f32 %581 = OpLoad %580 
                                       f32_4 %582 = OpCompositeConstruct %581 %581 %581 %581 
                                       f32_4 %583 = OpFMul %578 %582 
                                                      OpStore %51 %583 
                                       f32_4 %584 = OpLoad %51 
                                       f32_4 %586 = OpFMul %584 %585 
                                       f32_4 %587 = OpLoad %219 
                                       f32_4 %588 = OpFAdd %586 %587 
                                                      OpStore %51 %588 
                                         f32 %589 = OpLoad %77 
                                         f32 %590 = OpFNegate %589 
                                Private f32* %591 = OpAccessChain %9 %70 
                                         f32 %592 = OpLoad %591 
                                         f32 %593 = OpFMul %590 %592 
                                         f32 %594 = OpFAdd %593 %45 
                                Private f32* %595 = OpAccessChain %9 %48 
                                                      OpStore %595 %594 
                                       f32_4 %596 = OpLoad %39 
                                       f32_4 %597 = OpLoad %51 
                                       f32_4 %598 = OpFNegate %597 
                                       f32_4 %599 = OpFAdd %596 %598 
                                                      OpStore %39 %599 
                                       f32_3 %602 = OpLoad %9 
                                       f32_4 %603 = OpVectorShuffle %602 %602 0 0 0 0 
                                       f32_4 %604 = OpLoad %39 
                                       f32_4 %605 = OpFMul %603 %604 
                                       f32_4 %606 = OpLoad %51 
                                       f32_4 %607 = OpFAdd %605 %606 
                                                      OpStore %601 %607 
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