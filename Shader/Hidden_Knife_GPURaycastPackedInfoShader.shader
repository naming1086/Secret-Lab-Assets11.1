//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Knife/GPURaycastPackedInfoShader" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 59071
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int ObjectID;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out float vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
flat out uint vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
float u_xlat3;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat7 = dot(u_xlat1, u_xlat1);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlati1 = ObjectID + 1;
    vs_TEXCOORD2 = float(u_xlati1);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat3 * 0.5;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
    vs_TEXCOORD4 = uint(gl_VertexID);
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
uniform 	vec4 _ZBufferParams;
in  vec3 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
flat in  uint vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(128.0, 128.0, 128.0);
    u_xlat0.xyz = floor(u_xlat0.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(1000000.0, 1000.0);
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    SV_Target0.z = u_xlat0.z + u_xlat0.x;
    u_xlat0.x = vs_TEXCOORD3.z / vs_TEXCOORD3.w;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    SV_Target0.y = float(1.0) / u_xlat0.x;
    SV_Target0.x = float(vs_TEXCOORD4);
    SV_Target0.w = vs_TEXCOORD2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 180
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %44 %60 %88 %101 %151 %166 %170 %172 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate vs_TEXCOORD0 Location 44 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate vs_TEXCOORD1 Location 88 
                                                      OpDecorate vs_TEXCOORD2 Location 101 
                                                      OpDecorate vs_TEXCOORD3 Location 151 
                                                      OpMemberDecorate %164 0 BuiltIn 164 
                                                      OpMemberDecorate %164 1 BuiltIn 164 
                                                      OpMemberDecorate %164 2 BuiltIn 164 
                                                      OpDecorate %164 Block 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 170 
                                                      OpDecorate %172 BuiltIn 172 
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
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; i32;}* %21 = OpVariable Uniform 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %27 = OpConstant 0 
                                          i32 %35 = OpConstant 2 
                                              %43 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                              %58 = OpTypeVector %6 3 
                                              %59 = OpTypePointer Input %58 
                                 Input f32_3* %60 = OpVariable Input 
                                              %80 = OpTypePointer Private %6 
                                 Private f32* %81 = OpVariable Private 
                                              %87 = OpTypePointer Output %58 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                              %94 = OpTypePointer Private %18 
                                 Private i32* %95 = OpVariable Private 
                                              %96 = OpTypePointer Uniform %18 
                                             %100 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD2 = OpVariable Output 
                                             %130 = OpTypeVector %6 2 
                                         f32 %133 = OpConstant 3.674022E-40 
                                       f32_2 %134 = OpConstantComposite %133 %133 
                                Private f32* %138 = OpVariable Private 
                                         u32 %139 = OpConstant 1 
                                         u32 %142 = OpConstant 0 
                                             %143 = OpTypePointer Uniform %6 
                                         u32 %149 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                             %163 = OpTypeArray %6 %139 
                                             %164 = OpTypeStruct %7 %6 %163 
                                             %165 = OpTypePointer Output %164 
        Output struct {f32_4; f32; f32[1];}* %166 = OpVariable Output 
                                             %169 = OpTypePointer Output %14 
                         Output u32* vs_TEXCOORD4 = OpVariable Output 
                                             %171 = OpTypePointer Input %18 
                                  Input i32* %172 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %24 = OpAccessChain %21 %22 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %13 %25 
                                                      OpStore %9 %26 
                               Uniform f32_4* %28 = OpAccessChain %21 %22 %27 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %21 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                               Uniform f32_4* %46 = OpAccessChain %21 %22 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpLoad %11 
                                        f32_4 %49 = OpVectorShuffle %48 %48 3 3 3 3 
                                        f32_4 %50 = OpFMul %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpFAdd %50 %51 
                                                      OpStore vs_TEXCOORD0 %52 
                                        f32_4 %53 = OpLoad %9 
                               Uniform f32_4* %54 = OpAccessChain %21 %22 %45 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFAdd %53 %55 
                                                      OpStore %9 %56 
                                        f32_3 %61 = OpLoad %60 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %63 = OpAccessChain %21 %22 %22 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %62 %64 
                                                      OpStore %57 %65 
                               Uniform f32_4* %66 = OpAccessChain %21 %22 %27 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpLoad %60 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %57 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %57 %72 
                               Uniform f32_4* %73 = OpAccessChain %21 %22 %35 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpLoad %60 
                                        f32_4 %76 = OpVectorShuffle %75 %75 2 2 2 2 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %57 
                                        f32_4 %79 = OpFAdd %77 %78 
                                                      OpStore %57 %79 
                                        f32_4 %82 = OpLoad %57 
                                        f32_4 %83 = OpLoad %57 
                                          f32 %84 = OpDot %82 %83 
                                                      OpStore %81 %84 
                                          f32 %85 = OpLoad %81 
                                          f32 %86 = OpExtInst %1 32 %85 
                                                      OpStore %81 %86 
                                          f32 %89 = OpLoad %81 
                                        f32_3 %90 = OpCompositeConstruct %89 %89 %89 
                                        f32_4 %91 = OpLoad %57 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpFMul %90 %92 
                                                      OpStore vs_TEXCOORD1 %93 
                                 Uniform i32* %97 = OpAccessChain %21 %45 
                                          i32 %98 = OpLoad %97 
                                          i32 %99 = OpIAdd %98 %22 
                                                      OpStore %95 %99 
                                         i32 %102 = OpLoad %95 
                                         f32 %103 = OpConvertSToF %102 
                                                      OpStore vs_TEXCOORD2 %103 
                                       f32_4 %104 = OpLoad %9 
                                       f32_4 %105 = OpVectorShuffle %104 %104 1 1 1 1 
                              Uniform f32_4* %106 = OpAccessChain %21 %35 %22 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpFMul %105 %107 
                                                      OpStore %57 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %35 %27 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 0 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %57 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %57 %115 
                              Uniform f32_4* %116 = OpAccessChain %21 %35 %35 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpVectorShuffle %118 %118 2 2 2 2 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %57 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %57 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %35 %45 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpLoad %9 
                                       f32_4 %126 = OpVectorShuffle %125 %125 3 3 3 3 
                                       f32_4 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %57 
                                       f32_4 %129 = OpFAdd %127 %128 
                                                      OpStore %9 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 3 
                                       f32_2 %135 = OpFMul %132 %134 
                                       f32_4 %136 = OpLoad %57 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 1 5 3 
                                                      OpStore %57 %137 
                                Private f32* %140 = OpAccessChain %9 %139 
                                         f32 %141 = OpLoad %140 
                                Uniform f32* %144 = OpAccessChain %21 %27 %142 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpFMul %141 %145 
                                                      OpStore %138 %146 
                                         f32 %147 = OpLoad %138 
                                         f32 %148 = OpFMul %147 %133 
                                Private f32* %150 = OpAccessChain %57 %149 
                                                      OpStore %150 %148 
                                       f32_4 %152 = OpLoad %57 
                                       f32_2 %153 = OpVectorShuffle %152 %152 2 2 
                                       f32_4 %154 = OpLoad %57 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 3 
                                       f32_2 %156 = OpFAdd %153 %155 
                                       f32_4 %157 = OpLoad vs_TEXCOORD3 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 2 3 
                                                      OpStore vs_TEXCOORD3 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_2 %160 = OpVectorShuffle %159 %159 2 3 
                                       f32_4 %161 = OpLoad vs_TEXCOORD3 
                                       f32_4 %162 = OpVectorShuffle %161 %160 0 1 4 5 
                                                      OpStore vs_TEXCOORD3 %162 
                                       f32_4 %167 = OpLoad %9 
                               Output f32_4* %168 = OpAccessChain %166 %27 
                                                      OpStore %168 %167 
                                         i32 %173 = OpLoad %172 
                                         u32 %174 = OpBitcast %173 
                                                      OpStore vs_TEXCOORD4 %174 
                                 Output f32* %175 = OpAccessChain %166 %27 %139 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFNegate %176 
                                 Output f32* %178 = OpAccessChain %166 %27 %139 
                                                      OpStore %178 %177 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 90
; Schema: 0
                                 OpCapability Shader 
                          %1 = OpExtInstImport "GLSL.std.450" 
                                 OpMemoryModel Logical GLSL450 
                                 OpEntryPoint Fragment %4 "main" %11 %43 %53 %82 %86 
                                 OpExecutionMode %4 OriginUpperLeft 
                                 OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                 OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                 OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                 OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                 OpDecorate vs_TEXCOORD1 Location 11 
                                 OpDecorate %43 Location 43 
                                 OpDecorate vs_TEXCOORD3 Location 53 
                                 OpMemberDecorate %62 0 Offset 62 
                                 OpDecorate %62 Block 
                                 OpDecorate %64 DescriptorSet 64 
                                 OpDecorate %64 Binding 64 
                                 OpDecorate vs_TEXCOORD4 Flat 
                                 OpDecorate vs_TEXCOORD4 Location 82 
                                 OpDecorate vs_TEXCOORD2 Location 86 
                          %2 = OpTypeVoid 
                          %3 = OpTypeFunction %2 
                          %6 = OpTypeFloat 32 
                          %7 = OpTypeVector %6 3 
                          %8 = OpTypePointer Private %7 
           Private f32_3* %9 = OpVariable Private 
                         %10 = OpTypePointer Input %7 
   Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                     f32 %13 = OpConstant 3.674022E-40 
                   f32_3 %14 = OpConstantComposite %13 %13 %13 
                     f32 %17 = OpConstant 3.674022E-40 
                   f32_3 %18 = OpConstantComposite %17 %17 %17 
                         %22 = OpTypeVector %6 2 
                     f32 %25 = OpConstant 3.674022E-40 
                     f32 %26 = OpConstant 3.674022E-40 
                   f32_2 %27 = OpConstantComposite %25 %26 
                         %31 = OpTypeInt 32 0 
                     u32 %32 = OpConstant 1 
                         %33 = OpTypePointer Private %6 
                     u32 %36 = OpConstant 0 
                         %41 = OpTypeVector %6 4 
                         %42 = OpTypePointer Output %41 
           Output f32_4* %43 = OpVariable Output 
                     u32 %44 = OpConstant 2 
                         %50 = OpTypePointer Output %6 
                         %52 = OpTypePointer Input %41 
   Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                         %54 = OpTypePointer Input %6 
                     u32 %57 = OpConstant 3 
                         %62 = OpTypeStruct %41 
                         %63 = OpTypePointer Uniform %62 
Uniform struct {f32_4;}* %64 = OpVariable Uniform 
                         %65 = OpTypeInt 32 1 
                     i32 %66 = OpConstant 0 
                         %67 = OpTypePointer Uniform %6 
                         %81 = OpTypePointer Input %31 
     Input u32* vs_TEXCOORD4 = OpVariable Input 
     Input f32* vs_TEXCOORD2 = OpVariable Input 
                     void %4 = OpFunction None %3 
                          %5 = OpLabel 
                   f32_3 %12 = OpLoad vs_TEXCOORD1 
                   f32_3 %15 = OpFAdd %12 %14 
                                 OpStore %9 %15 
                   f32_3 %16 = OpLoad %9 
                   f32_3 %19 = OpFMul %16 %18 
                                 OpStore %9 %19 
                   f32_3 %20 = OpLoad %9 
                   f32_3 %21 = OpExtInst %1 8 %20 
                                 OpStore %9 %21 
                   f32_3 %23 = OpLoad %9 
                   f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                   f32_2 %28 = OpFMul %24 %27 
                   f32_3 %29 = OpLoad %9 
                   f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                 OpStore %9 %30 
            Private f32* %34 = OpAccessChain %9 %32 
                     f32 %35 = OpLoad %34 
            Private f32* %37 = OpAccessChain %9 %36 
                     f32 %38 = OpLoad %37 
                     f32 %39 = OpFAdd %35 %38 
            Private f32* %40 = OpAccessChain %9 %36 
                                 OpStore %40 %39 
            Private f32* %45 = OpAccessChain %9 %44 
                     f32 %46 = OpLoad %45 
            Private f32* %47 = OpAccessChain %9 %36 
                     f32 %48 = OpLoad %47 
                     f32 %49 = OpFAdd %46 %48 
             Output f32* %51 = OpAccessChain %43 %44 
                                 OpStore %51 %49 
              Input f32* %55 = OpAccessChain vs_TEXCOORD3 %44 
                     f32 %56 = OpLoad %55 
              Input f32* %58 = OpAccessChain vs_TEXCOORD3 %57 
                     f32 %59 = OpLoad %58 
                     f32 %60 = OpFDiv %56 %59 
            Private f32* %61 = OpAccessChain %9 %36 
                                 OpStore %61 %60 
            Uniform f32* %68 = OpAccessChain %64 %66 %44 
                     f32 %69 = OpLoad %68 
            Private f32* %70 = OpAccessChain %9 %36 
                     f32 %71 = OpLoad %70 
                     f32 %72 = OpFMul %69 %71 
            Uniform f32* %73 = OpAccessChain %64 %66 %57 
                     f32 %74 = OpLoad %73 
                     f32 %75 = OpFAdd %72 %74 
            Private f32* %76 = OpAccessChain %9 %36 
                                 OpStore %76 %75 
            Private f32* %77 = OpAccessChain %9 %36 
                     f32 %78 = OpLoad %77 
                     f32 %79 = OpFDiv %13 %78 
             Output f32* %80 = OpAccessChain %43 %32 
                                 OpStore %80 %79 
                     u32 %83 = OpLoad vs_TEXCOORD4 
                     f32 %84 = OpConvertUToF %83 
             Output f32* %85 = OpAccessChain %43 %36 
                                 OpStore %85 %84 
                     f32 %87 = OpLoad vs_TEXCOORD2 
             Output f32* %88 = OpAccessChain %43 %57 
                                 OpStore %88 %87 
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